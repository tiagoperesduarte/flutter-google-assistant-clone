import 'package:fluttergoogleassistantclone/app/utils/list_utils.dart';
import 'package:mobx/mobx.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

part 'footer_controller.g.dart';

class FooterController = _FooterControllerBase with _$FooterController;

abstract class _FooterControllerBase with Store {
  final SpeechToText _speechToText = SpeechToText();

  @observable
  ObservableList<String> suggestionChips = ObservableList<String>();

  @observable
  String recognizedWords;

  @observable
  bool inRecognition = false;

  void Function(String value) onSubmitted;

  @action
  addSuggestionChips(List<String> suggestionChips) {
    this.suggestionChips.clear();

    if (ListUtils.isNotEmpty(suggestionChips)) {
      this.suggestionChips.addAll(suggestionChips);
    }
  }

  @action
  cleanSuggestionChips() {
    suggestionChips.clear();
  }

  @action
  toggleRecognition() async {
    await _initSpeechToTextIfNotInitialized();

    if (!_speechToText.isAvailable) {
      return;
    }

    if (inRecognition) {
      _stopRecognition();
    } else {
      _startRecognition();
    }
  }

  _initSpeechToTextIfNotInitialized() async {
    if (_speechToText.isAvailable) {
      return;
    }

    await _speechToText.initialize();
  }

  _startRecognition() {
    inRecognition = true;
    suggestionChips.clear();

    _speechToText.listen(onResult: (SpeechRecognitionResult result) {
      recognizedWords = result.recognizedWords;

      if (!result.finalResult) {
        return;
      }

      if (onSubmitted != null) {
        onSubmitted(recognizedWords);
      }

      recognizedWords = null;
      inRecognition = false;
    });
  }

  _stopRecognition() {
    _speechToText.cancel();

    recognizedWords = null;
    inRecognition = false;
  }
}
