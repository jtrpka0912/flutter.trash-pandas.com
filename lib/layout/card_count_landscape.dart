// Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trashpandas/commons/card_count_field.dart';

// Models
import 'package:trashpandas/models/trash_panda_data.dart';

class CardCountLayoutLandscape extends StatelessWidget {

  final List<CardCountField> leftColumnFields;
  final List<CardCountField> rightColumnFields;

  CardCountLayoutLandscape({this.leftColumnFields, this.rightColumnFields});

  @override
  Widget build(BuildContext context) {
    return Consumer<TrashPandaData>(
      builder: (context, trashPandaData, child) {
        return Row(
          children: <Widget>[
            // Need to make it flexible to allow the text fields to adjust width
            Flexible(
              child: ListView(
                children: leftColumnFields,
              )
            ),
            Flexible(
              child: ListView(
                children: rightColumnFields,
              )
            )
          ],
        );
      }
    );
  }
}
