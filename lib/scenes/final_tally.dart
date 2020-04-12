// Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trashpandas/models/trash_panda_data.dart';
import 'package:trashpandas/scenes/player_count.dart';

class FinalTallyScene extends StatelessWidget {
  static const routeName = '/final';

  @override
  Widget build(BuildContext context) {
    return Consumer<TrashPandaData>(
      builder: (context, trashPandaData, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Final Tally'),
            centerTitle: true,
          ),
          body: Container(),
          bottomNavigationBar: BottomAppBar(
            child: Builder(
              builder: (context) => FlatButton(
                color: Theme.of(context).bottomAppBarTheme.color,
                child: Text('New Game'),
                onPressed: () {
                  // TODO: Maybe add alert to confirm new game.

                  // Restart the stats
                  trashPandaData = new TrashPandaData();

                  Navigator.pushNamed(
                    context,
                    PlayerCountScene.routeName
                  );
                },
              ),
            )
          ),
        );
      }
    );
  }
}
