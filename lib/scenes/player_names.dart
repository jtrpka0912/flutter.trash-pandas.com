// Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Models
import 'package:trashpandas/models/trash_panda_data.dart';

// Commons
import 'package:trashpandas/commons/player_name_field.dart';

class PlayerNamesScene extends StatelessWidget {

  final _playerNameKey = GlobalKey<FormState>();

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
            child: Form(
              key: _playerNameKey,
              child: ListView(
                children: constructPlayerNameField(trashPandaData).toList()
              )
            )
          ),
          // TODO: Figure out how to make this more DRY with other pages
          bottomNavigationBar: BottomAppBar(
            child: Builder(
              builder: (context) => FlatButton(
                color: Theme.of(context).bottomAppBarTheme.color,
                textColor: Colors.white,
                child: Text('Next'),
                onPressed: () {
                  if(_playerNameKey.currentState.validate()) {
                    // Go to next scene
                    print('Go to next scene!');
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
