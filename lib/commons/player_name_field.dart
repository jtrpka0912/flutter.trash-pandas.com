// Packages
import 'package:flutter/material.dart';

class PlayerNameField extends StatelessWidget {

  final String fieldLabel;

  PlayerNameField(this.fieldLabel);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            labelText: fieldLabel,
            labelStyle: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
      ],
    );
  }
}
