// Packages
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Models
import 'package:trashpandas/models/player.dart';
import 'package:trashpandas/models/enums.dart';

class TrashPandaData extends ChangeNotifier {
  // TODO: Look into UnModifiableListView
  List<Player> _players = [];

  void addPlayers(int howManyPlayers) {
    print('Calling addPlayers ${howManyPlayers.toString()}');
    _players.clear(); // Reset the player listing

    if(howManyPlayers > 1 && howManyPlayers < 5) {
      for(int x = 0; x < howManyPlayers; x++) {
        _players.add(Player()); // Add an empty player
      }
    } else if(howManyPlayers > 4) {
      throw Exception('You can not add more than four players.');
    } else if(howManyPlayers < 2) {
      throw Exception('You must have at least two players.');
    }

    notifyListeners();
  }

  int get playerCount {
    return _players.length;
  }

  Player getPlayer(int playerIndex) {
    try {
      return _players[playerIndex];
    } catch(Exception) {
      // TODO: May want to do something with the exception or throw one.
      return null;
    }
  }

  void setPlayerName(int playerIndex, String playerName) {
    // Need to explicitly set name, from here, to notify listeners.
    getPlayer(playerIndex).name = playerName;
    notifyListeners();
  }

  void applyShinyCount() => _addCardPoints(CardNames.Shiny, 3, 0, 0);
  void applyYumYumCount() => _addCardPoints(CardNames.YumYum, 4, 2, 0);
  void applyFeeshCount() => _addCardPoints(CardNames.Feesh, 5, 3, 1);
  void applyMmmPieCount() => _addCardPoints(CardNames.MmmPie, 6, 2, 1);
  void applyNannersCount() => _addCardPoints(CardNames.Nanners, 7, 0, 0);

  void applyBlammoCount() {
    for(Player player in _players) {
      player.increaseScore(player.getCardCount(CardNames.Blammo));
    }
  }

  void _addCardPoints(
    CardNames card,
    int firstPlacePoints,
    int secondPlacePoints,
    int thirdPlacePoints
  ) {
    for(Player mainPlayer in _players) {
      mainPlayer.increaseScore(
        _playerPosition(
          mainPlayer,
          card,
          firstPlacePoints,
          secondPlacePoints,
          thirdPlacePoints
        )
      );
    }
  }

  int _playerPosition(
    Player mainPlayer,
    CardNames card,
    int firstPlacePoints,
    int secondPlacePoints,
    int thirdPlacePoints
  ) {
    // Make a copy of the players list
    List<Player> otherPlayers = List.from(_players);
    otherPlayers.remove(mainPlayer); // Remove the main player from list
    bool isTied = false; // Initialize a flag if player tied with another player
    int higherThanPlayers = 0; // Make a count how players the main player beat

    // Loop through other players to check if main player either tied,
    //   or beat any players by card count.
    for(Player otherPlayer in otherPlayers) {
      int mainPlayerCardCount = mainPlayer.getCardCount(card);
      int otherPlayerCardCount = otherPlayer.getCardCount(card);

      // Check if not already tied and matches other players' card count
      if(mainPlayerCardCount == otherPlayerCardCount) {
        isTied = true;
        higherThanPlayers++;
      }

      // Check if player has higher card count than other player
      if(mainPlayerCardCount > otherPlayerCardCount) {
        higherThanPlayers++;
      }
    }

    // Get the number of points based on how many players the main player beat
    // If flagged for tie; then reduce the score by one point.
    // TODO: Need to refactor and made DRY
    switch(otherPlayers.length + 1) {
      case 2:
        switch(higherThanPlayers) {
          case 1:
            return isTied ? _checkBelowZero(firstPlacePoints - 1) : firstPlacePoints;
          default:
            return secondPlacePoints; // No need to check for tie
        }
        break;
      case 3:
        switch(higherThanPlayers) {
          case 2:
            return isTied ? _checkBelowZero(firstPlacePoints - 1) : firstPlacePoints;
          case 1:
            return isTied ? _checkBelowZero(secondPlacePoints - 1) : secondPlacePoints;
          default:
            return thirdPlacePoints; // No need to check for tie
        }
        break;
      case 4:
        switch(higherThanPlayers) {
          case 3:
            return isTied ? _checkBelowZero(firstPlacePoints - 1) : firstPlacePoints;
          case 2:
            return isTied ? _checkBelowZero(secondPlacePoints - 1) : secondPlacePoints;
          case 1:
            return isTied ? _checkBelowZero(thirdPlacePoints - 1) : thirdPlacePoints;
          default:
            return 0;
        }
    }

    // TODO: Should encase inside try/catch block
    return 0;
  }

  int _checkBelowZero(int score) {
    // This will check if tie breaker may reduce score below zero
    if(score < 0) {
      // Return score of zero instead of negative number
      return 0;
    } else {
      return score;
    }
  }
}