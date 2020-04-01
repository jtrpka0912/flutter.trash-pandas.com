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
}

class Player {
  bool _active = false;
  String _name;
  Map<Card, int> _cards;
  int _score = 0;

  bool get isActive {
    return _active;
  }

  set setPlayerActive(bool active) => _active = true;
  set setPlayerName(String name) => _name = name;
  set setShinyCount(stashedShiny) => _cards[Card.Shiny] = stashedShiny;
  set setYumYumCount(stashedYumYum) => _cards[Card.YumYum] = stashedYumYum;
  set setFeeshCount(stashedFeesh) => _cards[Card.Feesh] = stashedFeesh;
  set setMmmPieCount(stashedMmmPie) => _cards[Card.MmmPie] = stashedMmmPie;
  set setNannersCount(stashedNanners) => _cards[Card.Nanners] = stashedNanners;
  set setBlammoCount(stashedBlammo) => _cards[Card.Shiny] = stashedBlammo;
}

enum Card {
  Shiny,
  YumYum,
  Feesh,
  MmmPie,
  Nanners,
  Blammo
}