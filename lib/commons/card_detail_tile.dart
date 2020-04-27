// Packages
import 'package:flutter/material.dart';

// Models
import 'package:trashpandas/models/enums.dart';
import 'package:trashpandas/models/player.dart';

// Helpers
import 'package:trashpandas/helper_functions.dart';

class CardDetailTile extends StatelessWidget {
  final Player player;
  final CardNames card;

  CardDetailTile({this.player, this.card});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
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
  }
}
