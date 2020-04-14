// Models
import 'package:trashpandas/models/enums.dart';

class Player {
  // PROPERTIES
  // ==================

  String name;

  Map<CardNames, int> _cards = {
    CardNames.Shiny: 0,
    CardNames.YumYum: 0,
    CardNames.Nanners: 0,
    CardNames.MmmPie: 0,
    CardNames.Feesh: 0,
    CardNames.Blammo: 0,
  };

  Map<CardNames, int> _cardScores = {
    CardNames.Shiny: 0,
    CardNames.YumYum: 0,
    CardNames.Nanners: 0,
    CardNames.MmmPie: 0,
    CardNames.Feesh: 0,
    CardNames.Blammo: 0,
  };

  int _score = 0;

  // METHODS
  // ==================

  int get score => _score;

  int getCardCount(CardNames cardName) {
    return _cards[cardName];
  }

  void setCardCount(CardNames cardName, int count) {
    _cards[cardName] = count;
  }

  int getCardScore(CardNames cardName) {
    return _cardScores[cardName];
  }

  void setCardScore(CardNames cardName, int points) {
    _cardScores[cardName] = points;
  }

  void increaseScore(int points) => _score += points;

  void resetScore() => _score = 0;
}