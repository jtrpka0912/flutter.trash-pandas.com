// Packages
import 'package:flutter_test/flutter_test.dart';

// Models
import 'package:trashpandas/models/trash_panda_data.dart';
import 'package:trashpandas/models/player.dart';
import 'package:trashpandas/models/enums.dart';

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
      playerOne.setCardCount(CardNames.Blammo, 3);
      expect(playerOne.getCardCount(CardNames.Blammo), 3);

      Player playerTwo = data.getPlayer(1);
      playerTwo.setCardCount(CardNames.Blammo, 5);
      expect(playerTwo.getCardCount(CardNames.Blammo), 5);

      data.applyCardScores();

      expect(playerOne.score, 3);
      expect(playerTwo.score, 5);
    });

    test('Check who got points from Feesh', () {
      TrashPandaData data = TrashPandaData();
      data.addPlayers(3);
      expect(data.playerCount, 3);

      Player playerOne = data.getPlayer(0);
      playerOne.setCardCount(CardNames.Feesh, 3);

      Player playerTwo = data.getPlayer(1);
      playerTwo.setCardCount(CardNames.Feesh, 5);

      Player playerThree = data.getPlayer(2);
      playerThree.setCardCount(CardNames.Feesh, 2);

      data.applyCardScores();

      expect(playerOne.score, 3);
      expect(playerTwo.score, 5);
      expect(playerThree.score, 1);
    });

    test('Check who got points, with a tie, from YumYum', () {
      TrashPandaData data = TrashPandaData();
      data.addPlayers(3);
      expect(data.playerCount, 3);

      Player playerOne = data.getPlayer(0);
      playerOne.setCardCount(CardNames.YumYum, 1);

      Player playerTwo = data.getPlayer(1);
      playerTwo.setCardCount(CardNames.YumYum, 2);

      Player playerThree = data.getPlayer(2);
      playerThree.setCardCount(CardNames.YumYum, 1);

      data.applyCardScores();

      expect(playerOne.score, 1); // Gets one less (1 from 2) from tie
      expect(playerTwo.score, 4);
      expect(playerThree.score, 1); // Gets one less (1 from 2) from tie
    });

    test('Check who got points with different cards.', () {
      TrashPandaData data = TrashPandaData();
      data.addPlayers(4);

      Player playerOne = data.getPlayer(0);
      playerOne.name = 'Player One';
      playerOne.setCardCount(CardNames.YumYum, 1);
      playerOne.setCardCount(CardNames.Feesh, 3);
      playerOne.setCardCount(CardNames.Blammo, 3);
      playerOne.setCardCount(CardNames.Shiny, 1);

      Player playerTwo = data.getPlayer(1);
      playerTwo.name = 'Player Two';
      playerTwo.setCardCount(CardNames.YumYum, 2);
      playerTwo.setCardCount(CardNames.Feesh, 5);
      playerTwo.setCardCount(CardNames.Blammo, 5);
      playerTwo.setCardCount(CardNames.Shiny, 1);

      Player playerThree = data.getPlayer(2);
      playerThree.name = 'Player Three';
      playerThree.setCardCount(CardNames.YumYum, 1);
      playerThree.setCardCount(CardNames.Feesh, 2);
      playerThree.setCardCount(CardNames.Blammo, 0);
      playerThree.setCardCount(CardNames.Shiny, 1);

      Player playerFour = data.getPlayer(3);
      playerFour.name = 'Player Four';
      playerFour.setCardCount(CardNames.YumYum, 3);
      playerFour.setCardCount(CardNames.Feesh, 1);
      playerFour.setCardCount(CardNames.Blammo, 1);
      playerFour.setCardCount(CardNames.Shiny, 1);

      data.applyCardScores();

      expect(playerOne.score, 0 + 3 + 3 + 2);
      expect(playerTwo.score, 2 + 5 + 5 + 2);
      expect(playerThree.score, 0 + 1 + 0 + 2);
      expect(playerFour.score, 4 + 0 + 1 + 2);

      List<Player> sortedPlayers = [
        playerTwo,
        playerOne,
        playerFour,
        playerThree
      ];

      expect(sortedPlayers, data.getFinalPlayerTallyPlacement());
    });
  });
}
