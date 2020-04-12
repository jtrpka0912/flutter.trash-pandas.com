// Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trashpandas/commons/card_count_field.dart';

// Models
import 'package:trashpandas/models/trash_panda_data.dart';

class CardCountLayoutPortrait extends StatelessWidget {

  final List<CardCountField> fields;

  CardCountLayoutPortrait({this.fields});

  @override
  Widget build(BuildContext context) {
    return Consumer<TrashPandaData>(
      builder: (context, trashPandaData, child) {
        return Container(
          child: ListView(
            children: fields
          )
        );
      }
    );
  }
}
