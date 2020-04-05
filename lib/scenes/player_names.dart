// Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Models
import 'package:trashpandas/models/trash_panda_data.dart';
import 'package:trashpandas/models/player.dart';

// Commons
import 'package:trashpandas/commons/bottom_button.dart';
import 'package:trashpandas/commons/player_name_field.dart';

class PlayerNamesScene extends StatelessWidget {
  List<PlayerNameField> constructPlayerNameField(TrashPandaData trashPandaData) {
    int playerCounter = trashPandaData.playerCount;
    List<PlayerNameField> fields = [];

    if(playerCounter > 1 && playerCounter < 5) {
      for(int x = 0; x < playerCounter; x++) {
        fields.add(PlayerNameField(playerIndex: x)
        );
      }
    } else {
      // TODO: Need to show something if invalid amount.
    }

    return fields;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TrashPandaData>(
      builder: (context, trashPandaData, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Player Names'),
            centerTitle: true,
          ),
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
            child: ListView(
              children: constructPlayerNameField(trashPandaData).toList())
          ),
          bottomNavigationBar: BottomButton(
            buttonText: 'Next',
            onPressedMethod: () {
              print('To the player card count scene!');
              bool isValid = true;

              for(int x = 0; x < trashPandaData.playerCount; x++) {
                Player player = trashPandaData.getPlayer(x);
                print(player.name);
                if(player.name == '' || player.name == null) {
                  isValid = false;
                }
              }

              if(isValid) {
                // Go to next scene
                print('Go to next scene!');
              } else {
                // TODO: Broken! :(
                // Launch snack bar
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Please enter the name for all players.'),
                  ),
                );
              }
            }
          )
        );
      }
    );
  }
}
