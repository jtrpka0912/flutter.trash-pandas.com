// Packages
import 'package:flutter/foundation.dart';

class TrashPandaData extends ChangeNotifier {
  List<Player> _players = [];

  int get playerCount {
    return _players.length;
  }

  // TODO: Apply the tally methods here
  // ==================================
  // TODO: Apply Shiny Count
  // TODO: Apply YumYum Count
  // TODO: Apply Feesh Count
  // TODO: Apply MmmPie Count
  // TODO: Apply Nanners Count
  // TODO: Apply Blammo Count
  void applyBlammoCount() {
    for(Player player in _players) {
      player.increaseScore = player.blammoCount;
    }
  }

  // TODO: Make the method to check which player had the most of a card
  void _applyPositionPoints(
      List<Player> players,
      Card cardName,
      int first,
      int second,
      int third) {

  }
}

class Player {
  bool _active = false;
  String _name;
  Map<Card, int> _cards;
  int _score = 0;

  bool get isActive {
    return _active;
  }

  int get blammoCount => _cards[Card.Blammo];

  set playerActive(bool active) => _active = true;
  set playerName(String name) => _name = name;
  set shinyStash(int stashedShiny) => _cards[Card.Shiny] = stashedShiny;
  set yumYumStash(int stashedYumYum) => _cards[Card.YumYum] = stashedYumYum;
  set feeshStash(int stashedFeesh) => _cards[Card.Feesh] = stashedFeesh;
  set mmmPieStash(int stashedMmmPie) => _cards[Card.MmmPie] = stashedMmmPie;
  set nannersStash(int stashedNanners) => _cards[Card.Nanners] = stashedNanners;
  set blammoStash(int stashedBlammo) => _cards[Card.Shiny] = stashedBlammo;
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