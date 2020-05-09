import 'package:fluttergoogleassistantclone/app/models/message/bot_message.dart';
import 'package:fluttergoogleassistantclone/app/models/message/message.dart';
import 'package:fluttergoogleassistantclone/app/models/message/user_message.dart';
import 'package:fluttergoogleassistantclone/app/repositories/message_repository.dart';
import 'package:fluttergoogleassistantclone/app/widgets/footer/footer_controller.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final FooterController footerController = FooterController();

  final MessageRepository _messageRepository;

  _HomeControllerBase(this._messageRepository);

  @observable
  ObservableList<Message> messages = ObservableList<Message>.of([
    BotMessage.fromTexts(List.of(
      [
        "Lorem ipsum dolor sit amet",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
      ],
    )),
  ]);

  @action
  Future<void> process(String text) async {
    _addUserMessage(text);

    BotMessage botMessage = await _messageRepository.getBotMessage(text);

    footerController.addSuggestionChips(botMessage.suggestionChips);
    messages.add(botMessage);
  }

  void _addUserMessage(String text) {
    messages.add(UserMessage(text));
  }
}
