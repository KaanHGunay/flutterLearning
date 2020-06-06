import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final String _buttonText;
  final Function _buttonHandler;

  AdaptiveFlatButton(this._buttonText, this._buttonHandler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(
              _buttonText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: _buttonHandler,
          )
        : FlatButton(
            textColor: Theme.of(context).primaryColor,
            child: Text(
              _buttonText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: _buttonHandler,
          );
  }
}
