// Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Commons
import 'package:trashpandas/commons/styles.dart';

// Models
import 'package:trashpandas/models/trash_panda_data.dart';
import 'package:trashpandas/models/enums.dart';

// Helpers
import 'package:trashpandas/helper_functions.dart';

class CardCountField extends StatelessWidget {

  final int playerIndex;
  final CardNames card;

  CardCountField({this.playerIndex, this.card});

  @override
  Widget build(BuildContext context) {
    return Consumer<TrashPandaData>(
      builder: (context, trashPandaData, child) {
        return Container(
          padding: EdgeInsets.only(right: 10.0, bottom: 36.0, left: 10.0),
          child: ListTile(
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
              ),
            ),
            title: TextFormField(
              keyboardType: TextInputType.number,
              initialValue: trashPandaData
                .getPlayer(playerIndex)
                .getCardCount(card)
                .toString(),
              validator: (String numberOfCardsString) {
                // Give me a bad value; i'll give you zero! :D
                final int numberOfCards = int.tryParse(numberOfCardsString) ?? 0;

                if(numberOfCards < 0) {
                  return 'You can not have negative cards!';
                }

                switch(card) {
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
                  .setCardCount(card, numberOfCards);
              },
              decoration: InputDecoration(
                labelText: getCardName(card),
                labelStyle: formFieldTextStyles
              ),
            )
          )
        );
      },
    );
  }
}
