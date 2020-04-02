import 'package:flutter_test/flutter_test.dart';
import 'package:trashpandas/models/trash_panda_data.dart';

void main() {

  group('Player Tests', () {
    test('Add two players; player count should expect that much.', () {
      // TODO: Need to figure out how to set this before each test to make it DRY.
      TrashPandaData data = TrashPandaData();

      data.addPlayer(Player());
      data.addPlayer(Player());

      expect(data.playerCount, 2);
    });

    test('Fail after adding a fifth player.', () {
      TrashPandaData data = TrashPandaData();

      data.addPlayer(Player());
      data.addPlayer(Player());
      data.addPlayer(Player());
      data.addPlayer(Player());

      expect(() => data.addPlayer(Player()), throwsException);
    });
  });
  group('Score Tests', () {

  });
}
