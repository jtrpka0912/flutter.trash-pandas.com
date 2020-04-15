// Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Models
import 'package:trashpandas/models/trash_panda_data.dart';
import 'package:trashpandas/models/player.dart';
import 'package:trashpandas/models/enums.dart';

// Helpers
import 'package:trashpandas/helper_functions.dart';

class PlayerPlacementIconButton extends StatelessWidget {
  final Player player;

  PlayerPlacementIconButton({this.player});

  Widget buildBottomSheet(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          cardCountAndPoints(context, player)
        ],
      )
    );
  }

  Row cardCountAndPoints(BuildContext context, Player player) {
    List<Widget> left = [];
    List<Widget> right = [];
    
    int iterator = 0;
    for(CardNames card in CardNames.values) {
      ListTile cardDetail = ListTile(
        leading: Container(
          // TODO: Change color when text field is focused
          padding: EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            border: Border.all(
              color: Colors.black45,
              width: 2.0
            )
          ),
          child: Image.asset(
            'assets/images/${getCardName(card).toLowerCase()}.png',
            width: 25
          ),
        ),
        title: Text('${getCardName(card)}'),
        subtitle: Row(
          children: <Widget>[
            Text('Count: ${player.getCardCount(card)}'),
            SizedBox(width: 10.0),
            Text('Score: ${player.getCardScore(card)}')
          ],
        ),
      );

      if(iterator % 2 == 0) {
        left.add(cardDetail);
      } else {
        right.add(cardDetail);
      }
      
      iterator++;
    }
    
    Row row = Row(
      children: <Expanded>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: left,
          )
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: right,
          )
        )
      ]
    );
    
    return row;
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
