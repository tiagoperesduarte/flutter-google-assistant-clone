// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'footer_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FooterController on _FooterControllerBase, Store {
  final _$suggestionChipsAtom =
      Atom(name: '_FooterControllerBase.suggestionChips');

  @override
  ObservableList<String> get suggestionChips {
    _$suggestionChipsAtom.context.enforceReadPolicy(_$suggestionChipsAtom);
    _$suggestionChipsAtom.reportObserved();
    return super.suggestionChips;
  }

  @override
  set suggestionChips(ObservableList<String> value) {
    _$suggestionChipsAtom.context.conditionallyRunInAction(() {
      super.suggestionChips = value;
      _$suggestionChipsAtom.reportChanged();
    }, _$suggestionChipsAtom, name: '${_$suggestionChipsAtom.name}_set');
  }

  final _$recognizedWordsAtom =
      Atom(name: '_FooterControllerBase.recognizedWords');

  @override
  String get recognizedWords {
    _$recognizedWordsAtom.context.enforceReadPolicy(_$recognizedWordsAtom);
    _$recognizedWordsAtom.reportObserved();
    return super.recognizedWords;
  }

  @override
  set recognizedWords(String value) {
    _$recognizedWordsAtom.context.conditionallyRunInAction(() {
      super.recognizedWords = value;
      _$recognizedWordsAtom.reportChanged();
    }, _$recognizedWordsAtom, name: '${_$recognizedWordsAtom.name}_set');
  }

  final _$inRecognitionAtom = Atom(name: '_FooterControllerBase.inRecognition');

  @override
  bool get inRecognition {
    _$inRecognitionAtom.context.enforceReadPolicy(_$inRecognitionAtom);
    _$inRecognitionAtom.reportObserved();
    return super.inRecognition;
  }

  @override
  set inRecognition(bool value) {
    _$inRecognitionAtom.context.conditionallyRunInAction(() {
      super.inRecognition = value;
      _$inRecognitionAtom.reportChanged();
    }, _$inRecognitionAtom, name: '${_$inRecognitionAtom.name}_set');
  }

  final _$toggleRecognitionAsyncAction = AsyncAction('toggleRecognition');

  @override
  Future toggleRecognition() {
    return _$toggleRecognitionAsyncAction.run(() => super.toggleRecognition());
  }

  final _$_FooterControllerBaseActionController =
      ActionController(name: '_FooterControllerBase');

  @override
  dynamic addSuggestionChips(List<String> suggestionChips) {
    final _$actionInfo = _$_FooterControllerBaseActionController.startAction();
    try {
      return super.addSuggestionChips(suggestionChips);
    } finally {
      _$_FooterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic cleanSuggestionChips() {
    final _$actionInfo = _$_FooterControllerBaseActionController.startAction();
    try {
      return super.cleanSuggestionChips();
    } finally {
      _$_FooterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'suggestionChips: ${suggestionChips.toString()},recognizedWords: ${recognizedWords.toString()},inRecognition: ${inRecognition.toString()}';
    return '{$string}';
  }
}
