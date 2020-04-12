// Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Models
import 'package:trashpandas/models/trash_panda_data.dart';
import 'package:trashpandas/models/enums.dart';

class CardCountField extends StatelessWidget {

  final int playerIndex;
  final CardNames cardName;

  CardCountField({this.playerIndex, this.cardName});

  @override
  Widget build(BuildContext context) {
    return Consumer<TrashPandaData>(
      builder: (context, trashPandaData, child) {
        return Container(
          padding: EdgeInsets.only(bottom: 36.0),
          child: TextFormField(
            keyboardType: TextInputType.number,
            initialValue: trashPandaData
              .getPlayer(playerIndex)
              .getCardCount(CardNames.Shiny)
              .toString(),
            validator: (String numberOfCardsString) {
              // Give me a bad value; i'll give you zero! :D
              final int numberOfCards = int.tryParse(numberOfCardsString) ?? 0;

              if(numberOfCards < 0) {
                return 'You can not have negative cards!';
              }

              switch(cardName) {
                case CardNames.Shiny:
                  if(numberOfCards > 3) {
                    return 'You can not have more than three Shiny cards.';
                  }
                  break;
                case CardNames.YumYum:
                  if(numberOfCards > 5) {
                    return 'You can not have more than five Yum Yum cards.';
                  }
                  break;
                case CardNames.Feesh:
                  if(numberOfCards > 7) {
                    return 'You can not have more than seven Feesh cards.';
                  }
                  break;
                case CardNames.MmmPie:
                  if(numberOfCards > 9) {
                    return 'You can not have more than nine Mmm Pie cards.';
                  }
                  break;
                case CardNames.Nanners:
                  if(numberOfCards > 11) {
                    return 'You can not have more than eleven Nanner cards.';
                  }
                  break;
                case CardNames.Blammo:
                  if(numberOfCards > 13) {
                    return 'You can not have more than thirteen Blammo cards.';
                  }
                  break;
              }

              return null;
            },
            onSaved: (String numberOfCardsString) {
              final int numberOfCards = int.tryParse(numberOfCardsString) ?? 0;
              trashPandaData
                  .getPlayer(playerIndex)
                  .setCardCount(CardNames.Shiny, numberOfCards);
            },
            decoration: InputDecoration(
                labelText: cardName.toString(),
                // TODO: Make an external Text Style for both this and Player Name field.
                labelStyle: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500
                )
            ),
          )
        );
      },
    );
  }
}
