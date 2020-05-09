import 'package:fluttergoogleassistantclone/app/models/message/widget/message_widget.dart';
import 'package:fluttergoogleassistantclone/app/models/message/widget/message_widget_type.dart';

class CardWidget extends MessageWidget {
  String body;
  String supportingText;
  String imageUrl;

  CardWidget(
    String title,
    this.body,
    this.supportingText,
    this.imageUrl,
  ) : super(title, MessageWidgetType.card);

  factory CardWidget.fromJson(Map<String, dynamic> json) {
    String title = json['title'];
    String body = json['body'];
    String supportingText = json['supportingText'];
    String imageUrl = json['imageUrl'];

    return CardWidget(title, body, supportingText, imageUrl);
  }
}
