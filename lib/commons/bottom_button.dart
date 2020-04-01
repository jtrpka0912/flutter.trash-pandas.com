// Packages
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String buttonText;
  final Function onPressedMethod;

  BottomButton(this.buttonText, this.onPressedMethod);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      // Need to have a context builder for the snack bar to recognize the context.
      child: Builder(
        builder: (context) => FlatButton(
          color: Theme.of(context).accentColor,
          textColor: Colors.white,
          child: Text('Next'),
          onPressed: () {
            onPressedMethod();
          },
        )
      ),
      color: Theme.of(context).accentColor
    );
  }
}
