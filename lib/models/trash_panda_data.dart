// Packages
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TrashPandaData extends ChangeNotifier {
  List<Player> _players = [];

  int get playerCount {
    return _players.length;
  }

  void addPlayers(int howManyPlayers) {
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
  }

  Player getPlayer(int playerIndex) {
    try {
      return _players[playerIndex];
    } catch(Exception) {
      // TODO: May want to do something with the exception or throw one.
      return null;
    }
  }

  void applyShinyCount() => _addCardPoints(Card.Shiny, 3, 0, 0);
  void applyYumYumCount() => _addCardPoints(Card.YumYum, 4, 2, 0);
  void applyFeeshCount() => _addCardPoints(Card.Feesh, 5, 3, 1);
  void applyMmmPieCount() => _addCardPoints(Card.MmmPie, 6, 2, 1);
  void applyNannersCount() => _addCardPoints(Card.Nanners, 7, 0, 0);

  void applyBlammoCount() {
    for(Player player in _players) {
      player.increaseScore = player.getCardCount(Card.Blammo);
    }
  }

  // TODO: Make the method to check which player had the most of a card
  void _addCardPoints(
    Card card,
    int firstPlacePoints,
    int secondPlacePoints,
    int thirdPlacePoints
  ) {
    for(Player mainPlayer in _players) {
      mainPlayer.increaseScore = _playerPosition(mainPlayer, card, firstPlacePoints, secondPlacePoints, thirdPlacePoints);
    }
  }

  int _playerPosition(Player mainPlayer, Card card, int firstPlacePoints, int secondPlacePoints, int thirdPlacePoints) {
    /// Pick main player
    /// Loop through other players to see if any ties
    ///   Yes: Add player index to a list or flagged for tie
    ///   No: Check if higher than player
    ///     Yes: Increment how many players main player is higher
    ///     No: Continue
    /// Once loop is done; determine how many points player(s) get
    /// This is determined by player count
    /// If four players, and main player beats (based on increment):
    ///   0 players: fourth place
    ///   1 player: third place
    ///   2 players: second place
    ///   3 players: first place
    ///   If flagged for tie; decrease one point
    ///   Four Players: 0: 4th, 1: 3rd, 2: 2nd, 3: 1st
    ///   Three Players: 0: 3rd, 1: 2nd, 2: 1st
    ///   Two Players: 0: 2nd, 1: 1st
    ///
    List<Player> otherPlayers = List.from(_players);
    otherPlayers.remove(mainPlayer); // Remove the main player from list
    bool isTied = false;
    int higherThanPlayers = 0;

    for(Player otherPlayer in otherPlayers) {
      int mainPlayerCardCount = mainPlayer.getCardCount(card);
      int otherPlayerCardCount = otherPlayer.getCardCount(card);

      // Check if not already tied and matches other players' card count
      if(!isTied && (mainPlayerCardCount == otherPlayerCardCount)) {
        isTied = true;
        higherThanPlayers++;
      }

      // Check if player has higher card count than other player
      if(mainPlayerCardCount > otherPlayerCardCount) {
        higherThanPlayers++;
      }
    }

    // Get the number of points based on how many players the main player beat
    switch(otherPlayers.length + 1) {
      case 2:
        switch(higherThanPlayers) {
          case 1:
            return isTied ? firstPlacePoints - 1 : firstPlacePoints;
          default:
            return secondPlacePoints; // No need to check for tie
        }
        break;
      case 3:
        switch(higherThanPlayers) {
          case 2:
            return isTied ? firstPlacePoints - 1 : firstPlacePoints;
          case 1:
            return isTied ? secondPlacePoints - 1 : secondPlacePoints;
          default:
            return thirdPlacePoints; // No need to check for tie
        }
        break;
      case 4:
        switch(higherThanPlayers) {
          case 3:
            return isTied ? firstPlacePoints - 1 : firstPlacePoints;
          case 2:
            return isTied ? secondPlacePoints - 1 : secondPlacePoints;
          case 1:
            return isTied ? thirdPlacePoints - 1 : thirdPlacePoints;
          default:
            return 0;
        }
    }
    // Something happened
    // TODO: Should encase inside try/catch block
    return 0;
  }
}

class Player {
  bool _active = false;
  String _name;
  Map<Card, int> _cards = {};
  int _score = 0;

  bool get isActive => _active;
  String get name => _name;
  int get score => _score;

  int getCardCount(Card cardName) {
    return _cards[cardName];
  }

  void setCardCount(Card cardName, int count) {
    _cards[cardName] = count;
  }

  set playerActive(bool active) => _active = true;
  set playerName(String name) => _name = name;
  set increaseScore(int points) => _score += points;
}

enum Card {
  Shiny,
  YumYum,
  Feesh,
  MmmPie,
  Nanners,
  Blammo
}