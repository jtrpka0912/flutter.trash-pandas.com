// Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Models
import 'package:trashpandas/models/trash_panda_data.dart';

class PlayerNameField extends StatelessWidget {
  final int playerIndex;

  PlayerNameField({this.playerIndex});

  String buildFieldLabel(int playerIndex) {
    String playerPositionString;

    // TODO: Find a package that can convert a number to a word
    // Example: 1 to One
    switch (playerIndex) {
      case 0:
        playerPositionString = 'one';
        break;
      case 1:
        playerPositionString = 'two';
        break;
      case 2:
        playerPositionString = 'three';
        break;
      case 3:
        playerPositionString = 'four';
        break;
      default:
        playerPositionString = 'racoon';
    }

    return 'Player $playerPositionString name';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          onSubmitted: (String playerName) {
            final trashPandaData = Provider.of<TrashPandaData>(context, listen: false);
            trashPandaData.getPlayer(playerIndex).name = playerName;
          },
          decoration: InputDecoration(
            labelText: buildFieldLabel(playerIndex),
            labelStyle: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
        SizedBox(height: 36.0)
      ],
    );
  }
}
