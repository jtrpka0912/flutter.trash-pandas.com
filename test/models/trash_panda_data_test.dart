import 'package:flutter_test/flutter_test.dart';
import 'package:trashpandas/models/trash_panda_data.dart';

void main() {
  group('Player Tests', () {
    test('Add two players; player count should expect that much.', () {
      // TODO: Need to figure out how to set this before each test to make it DRY.
      TrashPandaData data = TrashPandaData();

      data.addPlayers(2);

      expect(data.playerCount, 2);
    });

    test('Reset player listing from three to four.', () {
      TrashPandaData data = TrashPandaData();

      data.addPlayers(3);
      expect(data.playerCount, 3);

      data.addPlayers(4);
      expect(data.playerCount, 4);
    });

    test('Fail trying to add five players.', () {
      TrashPandaData data = TrashPandaData();
      expect(() => data.addPlayers(5), throwsException);
    });

    test('Fail trying to add only one player.', () {
      TrashPandaData data = TrashPandaData();
      expect(() => data.addPlayers(1), throwsException);
    });

    test('Retrieve a player', () {
      TrashPandaData data = TrashPandaData();

      data.addPlayers(3);
      expect(data.playerCount, 3); // Test if player count matches

      Player playerTwo = data.getPlayer(1);
      expect(data.getPlayer(1), playerTwo);
      expect(data.getPlayer(2), isA<Player>());
    });

    test('Unable to retrieve a player.', () {
      TrashPandaData data = TrashPandaData();

      data.addPlayers(2);

      expect(data.getPlayer(2), null);
    });
  });

  group('Score Tests', () {
    test('Check if player blammo cards add up to scores.', () {
      TrashPandaData data = TrashPandaData();
      data.addPlayers(2);
      expect(data.playerCount, 2);

      Player playerOne = data.getPlayer(0);
      playerOne.setCardCount(Card.Blammo, 3);
      expect(playerOne.getCardCount(Card.Blammo), 3);

      Player playerTwo = data.getPlayer(1);
      playerTwo.setCardCount(Card.Blammo, 5);
      expect(playerTwo.getCardCount(Card.Blammo), 5);

      data.applyBlammoCount();

      expect(playerOne.score, 3);
      expect(playerTwo.score, 5);
    });

    test('Check who got points from Feesh', () {
      TrashPandaData data = TrashPandaData();
      data.addPlayers(3);
      expect(data.playerCount, 3);

      Player playerOne = data.getPlayer(0);
      playerOne.setCardCount(Card.Feesh, 3);
      expect(playerOne.getCardCount(Card.Feesh), 3);

      Player playerTwo = data.getPlayer(1);
      playerTwo.setCardCount(Card.Feesh, 5);
      expect(playerTwo.getCardCount(Card.Feesh), 5);

      Player playerThree = data.getPlayer(2);
      playerThree.setCardCount(Card.Feesh, 2);
      expect(playerThree.getCardCount(Card.Feesh), 2);

      data.applyFeeshCount();

      expect(playerOne.score, 3);
      expect(playerTwo.score, 5);
      expect(playerThree.score, 1);
    });

    test('Check who got points, with a tie, from YumYum', () {
      TrashPandaData data = TrashPandaData();
      data.addPlayers(3);
      expect(data.playerCount, 3);

      Player playerOne = data.getPlayer(0);
      playerOne.setCardCount(Card.YumYum, 1);
      expect(playerOne.getCardCount(Card.YumYum), 1);

      Player playerTwo = data.getPlayer(1);
      playerTwo.setCardCount(Card.YumYum, 2);
      expect(playerTwo.getCardCount(Card.YumYum), 2);

      Player playerThree = data.getPlayer(2);
      playerThree.setCardCount(Card.YumYum, 1);
      expect(playerThree.getCardCount(Card.YumYum), 1);

      data.applyYumYumCount();

      expect(playerOne.score, 1); // Gets one less (1 from 2) from tie
      expect(playerTwo.score, 4);
      expect(playerThree.score, 1); // Gets one less (1 from 2) from tie
    });
  });
}
