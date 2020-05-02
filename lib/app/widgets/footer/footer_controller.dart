import 'package:mobx/mobx.dart';

part 'footer_controller.g.dart';

class FooterController = _FooterControllerBase with _$FooterController;

abstract class _FooterControllerBase with Store {
  @observable
  bool hasSpeech = false;

  @action
  initSpeechToText() {
    hasSpeech = !hasSpeech;
  }
}
