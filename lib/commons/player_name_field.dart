// Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Commons
import 'package:trashpandas/commons/styles.dart';

// Models
import 'package:trashpandas/models/trash_panda_data.dart';

class PlayerNameField extends StatelessWidget {
  final int playerIndex;

  PlayerNameField({this.playerIndex});

  String _getPlayerNumberByWord(int playerIndex) {
    // TODO: Find a package that can convert a number to a word
    // Example: 1 to One
    switch (playerIndex) {
      case 0:
        return 'one';
        break;
      case 1:
        return 'two';
        break;
      case 2:
        return 'three';
        break;
      case 3:
        return 'four';
        break;
      default:
        return 'racoon';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TrashPandaData>(
      builder: (context, trashPandaData, child) {
        return Container(
          padding: EdgeInsets.only(bottom: 36.0),
          child: TextFormField(
            initialValue: trashPandaData.getPlayer(playerIndex).name,
            validator: (String playerName) {
              if(playerName.isEmpty) {
                return 'Must enter name for player ${_getPlayerNumberByWord(playerIndex)}';
              }
              return null;
            },
            onSaved: (String playerName) {
              trashPandaData.getPlayer(playerIndex).name = playerName;
            },
            decoration: InputDecoration(
              labelText: 'Player ${_getPlayerNumberByWord(playerIndex)} name',
              labelStyle: formFieldTextStyles,
            ),
          ),
        );
      },
    );
  }
}
