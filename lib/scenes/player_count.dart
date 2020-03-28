// Packages
import 'package:flutter/material.dart';

// Commons
import '../commons/player_count_button.dart';

class PlayerCountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Player Count'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text('How Many Players'),
          Row(
            children: <Widget>[
              PlayerCountButton(2),
              PlayerCountButton(3),
              PlayerCountButton(4)
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      bottomNavigationBar: BottomAppBar(
        child: FlatButton(
          onPressed: () {
            // This will go to Player Name screen
            print('I am pressed! Yay!');
          },
          child: Text('Next')
        )
      ),
    );
  }
}