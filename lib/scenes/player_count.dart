// Packages
import 'package:flutter/material.dart';

// Commons
import '../commons/player_count_button.dart';
import '../commons/bottom_app_bar.dart';

// Scenes
import '../scenes/player_names.dart';

class PlayerCountScene extends StatefulWidget {
  @override
  _PlayerCountSceneState createState() => _PlayerCountSceneState();
}

class _PlayerCountSceneState extends State<PlayerCountScene> {
  int _numberOfPlayers;

  @override
  void initState() {
    this._numberOfPlayers = 0;
    super.initState();
  }

  void updatePlayerCount(int playerCount) {
    setState(() {
      this._numberOfPlayers = playerCount;
    });
  }

  void onPressNextButton() {
    // This will go to Player Name screen
    print('No. of players: $_numberOfPlayers');
    if(_numberOfPlayers > 1 && _numberOfPlayers < 5) {
      // Do navigation
      print('Go to next scene');
      Navigator.push(
          context,
          MaterialPageRoute(
            // TODO: Change to PlayerName Scene
              builder: (context) => PlayerNamesScene()
          )
      );
    } else {
      // Show error message
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select the number of players that are playing.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Player Count'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(
            'How Many Players',
            // TODO: Put into a separate style file or something.
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
              height: 27.0
          ),
          Row(
            children: <Widget>[
              PlayerCountButton(2, updatePlayerCount),
              PlayerCountButton(3, updatePlayerCount),
              PlayerCountButton(4, updatePlayerCount)
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      bottomNavigationBar: TPBottomAppBar('Next', onPressNextButton)
    );
  }
}