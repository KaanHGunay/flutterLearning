import 'package:flutter/material.dart';

class ChangeButton extends StatelessWidget {

  final Function _changeText;

  ChangeButton(this._changeText);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('Click'),
      onPressed: _changeText,
    );
  }
}
