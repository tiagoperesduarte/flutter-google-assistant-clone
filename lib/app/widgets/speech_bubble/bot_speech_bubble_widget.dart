import 'package:flutter/material.dart';

class BotSpeechBubbleWidget extends StatelessWidget {
  final List<String> texts;

  BotSpeechBubbleWidget(this.texts);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildBubbles(),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildBubbles() {
    List<Widget> bubbles = List<Widget>();

    for (int i = 0; i < texts.length; i++) {
      bubbles.add(_buildBubble(texts[i], (i == 0)));
    }

    return bubbles;
  }

  Widget _buildBubble(String text, bool first) {
    return Container(
      margin: EdgeInsets.only(top: _getBubbleMarginTop(first)),
      padding: EdgeInsets.only(
        left: 18,
        right: 16,
        top: 12,
        bottom: 12,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Color(0xFFF0F1F3),
        ),
        borderRadius: _getBubbleBorderRadius(first),
      ),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Color(0xFF5F6267),
          fontSize: 15,
        ),
      ),
    );
  }

  double _getBubbleMarginTop(bool first) {
    return first ? 0 : 4;
  }

  BorderRadius _getBubbleBorderRadius(bool first) {
    if (first) {
      return BorderRadius.only(
        topRight: Radius.circular(20),
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      );
    }

    return BorderRadius.all(Radius.circular(20));
  }
}
