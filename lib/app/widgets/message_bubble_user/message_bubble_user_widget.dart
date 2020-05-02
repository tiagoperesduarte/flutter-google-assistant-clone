import 'package:flutter/material.dart';

class MessageBubbleUserWidget extends StatelessWidget {
  final String _text;

  MessageBubbleUserWidget(this._text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 5,
        bottom: 5,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    left: 18,
                    right: 16,
                    top: 12,
                    bottom: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F3F5),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Text(
                    _text,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF5F6267),
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
