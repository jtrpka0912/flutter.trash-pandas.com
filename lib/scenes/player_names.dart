// Packages
import 'package:flutter/material.dart';

// Commons
import '../commons/bottom_app_bar.dart';
import '../commons/player_name_field.dart';

class PlayerNamesScene extends StatefulWidget {
  @override
  _PlayerNamesSceneState createState() => _PlayerNamesSceneState();
}

class _PlayerNamesSceneState extends State<PlayerNamesScene> {

  List<PlayerNameField> constructPlayerNameField() {
    int playerCounter = 2;
    List<PlayerNameField> fields = [];

    if(playerCounter > 1 && playerCounter < 5) {
      for(int x = 0; x < playerCounter; x++) {
        // TODO: Find a package that can convert a number to a word
        // Example: 1 to One
        String playerPositionString;
        switch (x) {
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

        fields.add(PlayerNameField('Player $playerPositionString name'));
      }
    } else {
      // TODO: Need to show something if invalid amount.
    }

    return fields;
  }

  void onPressNextButton() {
    print('To the player card count scene!');
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: constructPlayerNameField().toList())
      ),
      bottomNavigationBar: TPBottomAppBar('Next', onPressNextButton)
    );
  }
}
