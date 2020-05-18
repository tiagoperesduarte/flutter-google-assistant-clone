import 'package:fluttergoogleassistantclone/app/models/message/bot_message.dart';
import 'package:fluttergoogleassistantclone/app/models/message/message.dart';
import 'package:fluttergoogleassistantclone/app/models/message/user_message.dart';
import 'package:fluttergoogleassistantclone/app/repositories/message_repository.dart';
import 'package:fluttergoogleassistantclone/app/utils/list_utils.dart';
import 'package:fluttergoogleassistantclone/app/widgets/footer/footer_controller.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final MessageRepository _messageRepository;
  final FooterController footerController = FooterController();

  _HomeControllerBase(this._messageRepository);

  @observable
  ObservableList<Message> messages = ObservableList<Message>();

  Future<void> loadMessages() async {
    List<Message> messages = await _messageRepository.getMessages();

    if (ListUtils.isNotEmpty(messages)) {
      this.messages.addAll(messages);
    }
  }

  @action
  Future<void> process(String text) async {
    messages.add(UserMessage(text));

    BotMessage botMessage = await _messageRepository.getBotMessage(text);

    footerController.addSuggestionChips(botMessage.suggestionChips);
    messages.add(botMessage);
  }
}
