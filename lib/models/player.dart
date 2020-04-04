// Models
import 'package:trashpandas/models/enums.dart';

class Player {
  String name;
  Map<Card, int> _cards = {};
  int _score = 0;

  int get score => _score;

  int getCardCount(Card cardName) {
    return _cards[cardName];
  }

  void setCardCount(Card cardName, int count) {
    _cards[cardName] = count;
  }

  void increaseScore(int points) => _score += points;
}