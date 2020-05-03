import 'package:fluttergoogleassistantclone/app/models/bot_message.dart';
import 'package:fluttergoogleassistantclone/app/models/message.dart';
import 'package:fluttergoogleassistantclone/app/models/user_message.dart';
import 'package:fluttergoogleassistantclone/app/repositories/message_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final MessageRepository _messageRepository;

  _HomeControllerBase(this._messageRepository);

  @observable
  ObservableList<Message> messages = ObservableList<Message>.of([
    BotMessage.fromText("Lorem ipsum dolor sit amet"),
  ]);

  @action
  Future<void> getMessage(String text) async {
    messages.add(UserMessage.fromText(text));
    messages.add(await _messageRepository.getMessage());
  }
}
