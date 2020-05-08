import 'package:dio/dio.dart';
import 'package:fluttergoogleassistantclone/app/pages/home/home_controller.dart';
import 'package:fluttergoogleassistantclone/app/repositories/message_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final List<SingleChildWidget> providers = libraries + repositories + controllers;

final List<SingleChildWidget> libraries = [
  Provider<Dio>(create: (_) => Dio()),
];

final List<SingleChildWidget> repositories = [
  ProxyProvider<Dio, MessageRepository>(update: (_, dio, __) => MessageRepository(dio)),
];

final List<SingleChildWidget> controllers = [
  ProxyProvider<MessageRepository, HomeController>(
      update: (_, messageRepository, __) => HomeController(messageRepository))
];
