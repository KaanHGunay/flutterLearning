import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function _selectHandler;
  final String _text;

  Answer(this._selectHandler, this._text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(_text),
        onPressed: _selectHandler,
      ),
    );
  }
}
