// Packages
import 'package:flutter/material.dart';

class PlayerCountButton extends StatelessWidget {

  final int playerNumber;
  final Function updatePlayerCount;

  PlayerCountButton(this.playerNumber, this.updatePlayerCount);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      padding: EdgeInsets.all(3.0),
      child: Text(playerNumber.toString()),
      onPressed: () {
        updatePlayerCount(playerNumber);
      },
    );
  }
}
