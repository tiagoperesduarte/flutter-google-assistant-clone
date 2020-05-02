import 'package:flutter/material.dart';
import 'package:flutterdialogflow/app/widgets/message_bubble_bot/message_bubble_bot_widget.dart';
import 'package:flutterdialogflow/app/widgets/message_bubble_user/message_bubble_user_widget.dart';

class MessageWidget extends StatelessWidget {
  final String text;
  final bool isUser;

  MessageWidget({this.text, this.isUser});

  @override
  Widget build(BuildContext context) {
    return isUser ? MessageBubbleUserWidget(text) : MessageBubbleBotWidget(text);
  }
}
