import 'package:flutter/material.dart';
import 'package:flutterdialogflow/app/widgets/message/message_widget.dart';
import 'package:flutterdialogflow/app/widgets/message_list/message_list_controller.dart';
import 'package:provider/provider.dart';

class MessageListWidget extends StatefulWidget {
  @override
  _MessageListWidgetState createState() => _MessageListWidgetState();
}

class _MessageListWidgetState extends State<MessageListWidget> {
  @override
  Widget build(BuildContext context) {
    final _messageListController = Provider.of<MessageListController>(context);

    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 11,
        bottom: 11,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          MessageWidget(
            text: "Lorem ipsum dolor sit amet",
            isUser: true,
          ),
          MessageWidget(
            text: "Lorem ipsum dolor sit amet",
            isUser: false,
          ),
          MessageWidget(
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
            isUser: true,
          ),
          MessageWidget(
            text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
            isUser: false,
          ),
        ],
      ),
    );
  }
}
