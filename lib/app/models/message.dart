import 'package:flutter/material.dart';
import 'package:fluttergoogleassistantclone/app/models/message_from.dart';

abstract class Message {
  MessageFrom from;

  Widget toWidget();
}
