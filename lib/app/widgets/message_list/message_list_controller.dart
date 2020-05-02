import 'package:mobx/mobx.dart';

part 'message_list_controller.g.dart';

class MessageListController = _MessageListControllerBase with _$MessageListController;

abstract class _MessageListControllerBase with Store {}
