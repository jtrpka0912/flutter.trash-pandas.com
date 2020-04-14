// Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Models
import 'package:trashpandas/models/trash_panda_data.dart';
import 'package:trashpandas/models/player.dart';

class PlayerPlacementIconButton extends StatelessWidget {
  final Player player;

  PlayerPlacementIconButton({this.player});

  @override
  Widget build(BuildContext context) {
    return Consumer<TrashPandaData>(
      builder: (context, trashPandaData, child) {
        return IconButton(
          icon: Icon(Icons.info),
          onPressed: () {
            // TODO: Bring up modal
            print('Bring up modal');
          },
        );
      }
    );
  }
}
