import 'package:flutter/material.dart';

class ScreenText extends StatelessWidget {

  final _text;

  ScreenText(this._text);

  @override
  Widget build(BuildContext context) {
    return Text(_text);
  }
}
