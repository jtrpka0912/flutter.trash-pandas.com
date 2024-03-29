// Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Scenes
import 'package:trashpandas/scenes/final_tally.dart';

// Commons
import 'package:trashpandas/commons/card_count_field.dart';

// Layouts
import 'package:trashpandas/layout/card_count_portrait.dart';
import 'package:trashpandas/layout/card_count_landscape.dart';

// Models
import 'package:trashpandas/models/trash_panda_data.dart';
import 'package:trashpandas/models/player.dart';
import 'package:trashpandas/models/enums.dart';

class CardCountScene extends StatelessWidget {
  static const routeName = '/cards';
  final _cardCountKey = GlobalKey<FormState>();

  String nextOrFinal(int playerIndex, int playerCount) {
    return morePlayersAhead(playerIndex, playerCount) ? 'Next' : 'Final Tally';
  }
  
  bool morePlayersAhead(int playerIndex, int playerCount) {
    return playerIndex + 1 < playerCount;
  }

  List<CardCountField> constructCardCountFields(BuildContext context, TrashPandaData trashPandaData, int playerIndex, [bool isLeft = false]) {
    // TODO: Maybe could use some refactoring.
    List<CardCountField> leftColumnFields = [];
    List<CardCountField> rightColumnFields = [];
    List<CardCountField> singleColumnFields = [];

    // Retrieve the current orientation
    Orientation currentOrientation = MediaQuery.of(context).orientation;

    // Loop through all of the card names
    // Then place some on the left and some on the right
    int iterator = 0; // Helpful to put cards on left and right
    for(CardNames cardName in CardNames.values) {
      CardCountField field = CardCountField(
        playerIndex: playerIndex,
        card: cardName
      );

      if(currentOrientation == Orientation.landscape) {
        // Landscape: Do two columns
        if(iterator % 2 == 0) {
          leftColumnFields.add(field);
        } else {
          rightColumnFields.add(field);
        }
      } else {
        // Portrait: Just one column
        singleColumnFields.add(field);
      }

      iterator++;
    }

    if(currentOrientation == Orientation.landscape) {
      if(isLeft) {
        return leftColumnFields;
      } else {
        return rightColumnFields;
      }
    } else {
      return singleColumnFields;
    }
  }

  @override
  Widget build(BuildContext context) {
    final int playerIndex = ModalRoute.of(context).settings.arguments;

    Widget layoutByOrientation(TrashPandaData trashPandaData) {
      if(MediaQuery.of(context).orientation == Orientation.portrait) {
        return CardCountLayoutPortrait(
          fields: constructCardCountFields(context, trashPandaData, playerIndex)
        );
      } else {
        return CardCountLayoutLandscape(
          leftColumnFields: constructCardCountFields(context, trashPandaData, playerIndex, true),
          rightColumnFields: constructCardCountFields(context, trashPandaData, playerIndex, false),
        );
      }
    }

    return Consumer<TrashPandaData>(
      builder: (context, trashPandaData, child) {
        Player player = trashPandaData.getPlayer(playerIndex);

        return Scaffold(
          // TODO: Make a separate widget for the AppBar
          appBar: AppBar(
            title: Text('Card Count for ${player.name}'),
            centerTitle: true,
          ),
          body: Center(
            child: Form(
              key: _cardCountKey,
              child: layoutByOrientation(trashPandaData)
            )
          ),
          bottomNavigationBar: BottomAppBar(
            child: Builder(
              builder: (context) => FlatButton(
                color: Theme.of(context).bottomAppBarTheme.color,
                child: Text(nextOrFinal(playerIndex, trashPandaData.playerCount)),
                onPressed: () {
                  if(_cardCountKey.currentState.validate()) {
                    _cardCountKey.currentState.save();

                    if(morePlayersAhead(playerIndex, trashPandaData.playerCount)) {
                      // Go to next player
                      Navigator.pushNamed(
                        context,
                        CardCountScene.routeName,
                        arguments: playerIndex + 1
                      );
                    } else {
                      trashPandaData.resetPlayerScores();
                      trashPandaData.applyCardScores();

                      // Go to the final tally scene
                      Navigator.pushNamed(
                        context,
                        FinalTallyScene.routeName
                      );
                    }
                  }
                },
              )
            ),
          ),
        );
      },
    );
  }
}
