// Packages
import 'package:flutter/material.dart';

class PlayerCountButton extends StatelessWidget {

  final int playerNumber;

  PlayerCountButton(this.playerNumber);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.blue,
      textColor: Colors.white,
      padding: EdgeInsets.all(3.0),
      child: Text(playerNumber.toString()),
      onPressed: () {
        print('$playerNumber Players!');
      },
    );
  }
}
