// Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trashpandas/commons/card_detail_tile.dart';

// Commons
import 'package:trashpandas/commons/card_detail_tile.dart';

// Models
import 'package:trashpandas/models/trash_panda_data.dart';
import 'package:trashpandas/models/player.dart';
import 'package:trashpandas/models/enums.dart';

class PlayerPlacementIconButton extends StatelessWidget {
  final Player player;

  PlayerPlacementIconButton({this.player});

  Container buildBottomSheet(BuildContext context) {
    return Container(
      child: cardCountAndPoints(context, player),
    );
  }

  Row cardCountAndPoints(BuildContext context, Player player) {
    List<CardDetailTile> left = [];
    List<CardDetailTile> right = [];

    int iterator = 0;
    for(CardNames card in CardNames.values) {
      CardDetailTile cardDetailTile = CardDetailTile(
        player: player,
        card: card
      );

      if(iterator % 2 == 0) {
        left.add(cardDetailTile);
      } else {
        right.add(cardDetailTile);
      }

      iterator++;
    }

    return Row(
      children: <Expanded>[
        Expanded(
          child: Column(
            children: left,
          )
        ),
        Expanded(
          child: Column(
            children: right,
          )
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TrashPandaData>(
      builder: (context, trashPandaData, child) {
        return IconButton(
          icon: Icon(
            Icons.info,
            semanticLabel: 'Detail of score',
          ),
          color: Theme.of(context).primaryColor,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: buildBottomSheet
            );
          },
        );
      }
    );
  }
}
