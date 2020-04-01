// Packages
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
      player.increaseScore = player.getCardCount(Card.Blammo);
    }
  }

  // TODO: Make the method to check which player had the most of a card
  void _addCardPoints(
    List<Player> players,
    Card cardName,
    int first,
    int second,
    int third) {
    }
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