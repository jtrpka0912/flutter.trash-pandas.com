// Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Models
import 'package:trashpandas/models/trash_panda_data.dart';
import 'package:trashpandas/models/player.dart';

// Commons
import 'package:trashpandas/commons/bottom_button.dart';
import 'package:trashpandas/commons/player_name_field.dart';

class PlayerNamesScene extends StatefulWidget {
  @override
  _PlayerNamesSceneState createState() => _PlayerNamesSceneState();
}

class _PlayerNamesSceneState extends State<PlayerNamesScene> {
  List<PlayerNameField> constructPlayerNameField() {
    final trashPandaData = Provider.of<TrashPandaData>(context, listen: false);
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

  void onPressNextButton() {
    print('To the player card count scene!');
    final trashPandaData = Provider.of<TrashPandaData>(context, listen: false);
    bool isValid = true;

    for(int x = 0; x < trashPandaData.playerCount; x++) {
      Player player = trashPandaData.getPlayer(x);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Player Names'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
        child: ListView(
          children: constructPlayerNameField().toList())
      ),
      bottomNavigationBar: BottomButton(
        buttonText: 'Next',
        onPressedMethod: onPressNextButton
      )
    );
  }
}
