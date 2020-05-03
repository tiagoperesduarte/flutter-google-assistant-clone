import 'package:flutter/material.dart';
import 'package:flutterdialogflow/app/models/message_from.dart';

abstract class Message {
  MessageFrom from;

  Widget toWidget();
}
