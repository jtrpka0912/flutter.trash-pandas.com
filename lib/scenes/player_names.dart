// Packages
import 'package:flutter/material.dart';

class PlayerNamesScene extends StatefulWidget {
  @override
  _PlayerNamesSceneState createState() => _PlayerNamesSceneState();
}

class _PlayerNamesSceneState extends State<PlayerNamesScene> {

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
      bottomNavigationBar: BottomAppBar(
        child: Builder(
          builder: (context) => FlatButton(
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            child: Text('Next'),
            onPressed: () {
              print('Go to player card count scene.');
            }
          ),
        ),
        color: Theme.of(context).accentColor
      ),
    );
  }
}
