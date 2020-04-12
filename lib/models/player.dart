// Models
import 'package:flutter/material.dart';
import 'package:trashpandas/models/enums.dart';

class Player {
  String name;
  Map<CardNames, int> _cards = {
    CardNames.Shiny: 0,
    CardNames.YumYum: 0,
    CardNames.Nanners: 0,
    CardNames.MmmPie: 0,
    CardNames.Feesh: 0,
    CardNames.Blammo: 0,
  };
  int _score = 0;

  int get score => _score;

  int getCardCount(CardNames cardName) {
    return _cards[cardName];
  }

  void setCardCount(CardNames cardName, int count) {
    _cards[cardName] = count;
  }

  void increaseScore(int points) => _score += points;
}