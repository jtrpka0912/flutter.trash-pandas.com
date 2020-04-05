// Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Model
import 'package:trashpandas/models/trash_panda_data.dart';

class PlayerCountButton extends StatelessWidget {

  final int numberOfPlayers;
  final Color buttonColor;

  PlayerCountButton({this.numberOfPlayers, this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Consumer<TrashPandaData>(
      builder: (context, trashPandaData, child) {
        return FlatButton(
          color: buttonColor,
          textColor: Colors.white,
          padding: EdgeInsets.all(3.0),
          child: Text(numberOfPlayers.toString()),
          onPressed: () {
            trashPandaData.addPlayers(numberOfPlayers);
            print('${trashPandaData.playerCount.toString()} vs $numberOfPlayers');
          },
        );
      }
    );
  }
}
