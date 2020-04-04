// Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Models
import 'package:trashpandas/models/trash_panda_data.dart';

// Commons
import 'package:trashpandas/commons/player_count_button.dart';
import 'package:trashpandas/commons/bottom_button.dart';

// Scenes
import 'package:trashpandas/scenes/player_names.dart';

class PlayerCountScene extends StatefulWidget {
  @override
  _PlayerCountSceneState createState() => _PlayerCountSceneState();
}

class _PlayerCountSceneState extends State<PlayerCountScene> {
  void onPressNextButton() {
    final trashPandaData = Provider.of<TrashPandaData>(context, listen: false);

    // This will go to Player Name screen
    print('No. of players: ${trashPandaData.playerCount}');
    if(trashPandaData.playerCount > 1 && trashPandaData.playerCount < 5) {
      // Do navigation
      print('Go to next scene');
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PlayerNamesScene()
          )
      );
    } else {
      // TODO: Broken! :(
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
              PlayerCountButton(numberOfPlayers: 2),
              PlayerCountButton(numberOfPlayers: 3),
              PlayerCountButton(numberOfPlayers: 4)
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      bottomNavigationBar: BottomButton(
        buttonText: 'Next',
        onPressedMethod: onPressNextButton
      )
    );
  }
}