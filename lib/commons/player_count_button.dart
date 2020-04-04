// Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Model
import 'package:trashpandas/models/trash_panda_data.dart';

class PlayerCountButton extends StatelessWidget {

  final int numberOfPlayers;

  PlayerCountButton({this.numberOfPlayers});
//
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      padding: EdgeInsets.all(3.0),
      child: Text(numberOfPlayers.toString()),
      onPressed: () {
        // TODO: Change the color of the button to the accentColor when pressed
        // updatePlayerCount(numberOfPlayers);
        Provider.of<TrashPandaData>(context, listen: false).addPlayers(numberOfPlayers);
      },
    );
  }
}
