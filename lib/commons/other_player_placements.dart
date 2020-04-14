// Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Models
import 'package:trashpandas/models/trash_panda_data.dart';
import 'package:trashpandas/models/player.dart';

// Commons
import 'package:trashpandas/commons/player_placement_icon_button.dart';

class OtherPlayerPlacement extends StatelessWidget {
  final Player player;
  final String placementText;

  OtherPlayerPlacement({this.player, this.placementText});


  @override
  Widget build(BuildContext context) {
    return Consumer<TrashPandaData>(
      builder: (context, trashPandaData, child) {
        return ListTile(
          leading: DecoratedBox(
            decoration: BoxDecoration(
              // TODO: Reuse from card count field
              border: Border.all(
                color: Colors.black45,
                width: 2.0
              )
            ),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 9.0),
              width: 50.0,
              child: Text(
                placementText,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600
                ),
              ),
            )
          ),
          title: Text('${player.name} (${player.score})'),
          trailing: PlayerPlacementIconButton(player: player),
        );
      }
    );
  }
}
