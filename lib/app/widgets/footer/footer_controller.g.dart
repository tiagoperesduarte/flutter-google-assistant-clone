// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'footer_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FooterController on _FooterControllerBase, Store {
  final _$hasSpeechAtom = Atom(name: '_FooterControllerBase.hasSpeech');

  @override
  bool get hasSpeech {
    _$hasSpeechAtom.context.enforceReadPolicy(_$hasSpeechAtom);
    _$hasSpeechAtom.reportObserved();
    return super.hasSpeech;
  }

  @override
  set hasSpeech(bool value) {
    _$hasSpeechAtom.context.conditionallyRunInAction(() {
      super.hasSpeech = value;
      _$hasSpeechAtom.reportChanged();
    }, _$hasSpeechAtom, name: '${_$hasSpeechAtom.name}_set');
  }

  final _$_FooterControllerBaseActionController =
      ActionController(name: '_FooterControllerBase');

  @override
  dynamic initSpeechToText() {
    final _$actionInfo = _$_FooterControllerBaseActionController.startAction();
    try {
      return super.initSpeechToText();
    } finally {
      _$_FooterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'hasSpeech: ${hasSpeech.toString()}';
    return '{$string}';
  }
}
