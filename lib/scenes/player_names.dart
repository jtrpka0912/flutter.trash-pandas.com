// Packages
import 'package:flutter/material.dart';

// Commons
import '../commons/bottom_app_bar.dart';

class PlayerNamesScene extends StatefulWidget {
  @override
  _PlayerNamesSceneState createState() => _PlayerNamesSceneState();
}

class _PlayerNamesSceneState extends State<PlayerNamesScene> {

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Player One Name',
              textAlign: TextAlign.left,
            ),
            TextField()
          ]
        )
      ),
      bottomNavigationBar: TPBottomAppBar('Next', onPressNextButton)
    );
  }
}
