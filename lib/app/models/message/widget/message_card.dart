import 'package:flutter/material.dart';
import 'package:fluttergoogleassistantclone/app/models/message/widget/message_widget.dart';
import 'package:fluttergoogleassistantclone/app/models/message/widget/message_widget_type.dart';
import 'package:fluttergoogleassistantclone/app/widgets/card/card_widget.dart';

class MessageCard extends MessageWidget {
  String body;
  String supportingText;
  String imageUrl;

  MessageCard(
    String title,
    this.body,
    this.supportingText,
    this.imageUrl,
  ) : super(title, MessageWidgetType.card);

  factory MessageCard.fromJson(Map<String, dynamic> json) {
    String title = json['title'];
    String body = json['body'];
    String supportingText = json['supportingText'];
    String imageUrl = json['imageUrl'];

    return MessageCard(title, body, supportingText, imageUrl);
  }

  @override
  Widget toWidget() {
    return CardWidget(
      title: title,
      body: body,
      supportingText: supportingText,
      imageUrl: imageUrl,
    );
  }
}
