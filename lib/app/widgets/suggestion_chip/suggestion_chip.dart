import 'package:flutter/material.dart';

class SuggestionChip extends StatelessWidget {
  final String _text;

  SuggestionChip(this._text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 10,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Color(0xFFE9EAED),
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        _text,
        style: TextStyle(
          fontSize: 15,
        ),
      ),
    );
  }
}
