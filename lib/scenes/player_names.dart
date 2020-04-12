// Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Models
import 'package:trashpandas/models/trash_panda_data.dart';

// Commons
import 'package:trashpandas/commons/player_name_field.dart';

// Scenes
import 'package:trashpandas/scenes/card_count.dart';

class PlayerNamesScene extends StatelessWidget {
  static const routeName = '/name';

  final _playerNameKey = GlobalKey<FormState>();

  List<PlayerNameField> constructPlayerNameFields(TrashPandaData trashPandaData) {
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
            centerTitle: true
          ),
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
            child: Form(
              key: _playerNameKey,
              child: ListView(
                children: constructPlayerNameFields(trashPandaData).toList()
              )
            )
          ),
          // TODO: Figure out how to make this more DRY with other pages
          bottomNavigationBar: BottomAppBar(
            child: Builder(
              builder: (context) => FlatButton(
                color: Theme.of(context).bottomAppBarTheme.color,
                child: Text('Next'),
                onPressed: () {
                  if(_playerNameKey.currentState.validate()) {
                    _playerNameKey.currentState.save();
                    // Go to next scene
                    Navigator.pushNamed(
                      context,
                      CardCountScene.routeName,
                      arguments: 0
                    );
                  } else {
                    // Launch snack bar
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please enter the name for all players.'),
                      ),
                    );
                  }
                },
              )
            ),
          ),
        );
      }
    );
  }
}
