import 'package:flutter/material.dart';
import 'package:fluttergoogleassistantclone/app/models/message/message_from.dart';

abstract class Message {
  MessageFrom from;

  Message(this.from);

  Widget toWidget();
}
