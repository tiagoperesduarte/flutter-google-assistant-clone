import 'package:flutterdialogflow/app/pages/home_controller.dart';
import 'package:mobx/mobx.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

part 'footer_controller.g.dart';

class FooterController = _FooterControllerBase with _$FooterController;

abstract class _FooterControllerBase with Store {
  final SpeechToText _speechToText;
  final HomeController _homeController;

  @observable
  bool inRecognition = false;

  @observable
  String recognizedWords;

  bool _speechToTextInitialized = false;

  _FooterControllerBase(this._speechToText, this._homeController);

  @action
  toggleRecognition() async {
    await _initSpeechToTextIfNotInitialized();

    if (!_speechToTextInitialized) {
      return;
    }

    if (inRecognition) {
      _stopRecognition();
    } else {
      _startRecognition();
    }
  }

  _startRecognition() {
    inRecognition = true;

    _speechToText.listen(
      onResult: (SpeechRecognitionResult result) {
        recognizedWords = result.recognizedWords;

        if (!result.finalResult) {
          return;
        }

        _homeController.getMessage(recognizedWords);

        recognizedWords = null;
        inRecognition = false;
      },
    );
  }

  _stopRecognition() {
    _speechToText.cancel();

    recognizedWords = null;
    inRecognition = false;
  }

  _initSpeechToTextIfNotInitialized() async {
    if (_speechToTextInitialized) {
      return;
    }

    _speechToTextInitialized = await _speechToText.initialize(onStatus: (String status) {
      print(status);
    }, onError: (SpeechRecognitionError error) {
      print("${error.errorMsg} - ${error.permanent}");
    });
  }
}
