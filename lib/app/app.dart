import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterdialogflow/app/pages/home_controller.dart';
import 'package:flutterdialogflow/app/pages/home_page.dart';
import 'package:flutterdialogflow/app/repositories/message_repository.dart';
import 'package:flutterdialogflow/app/widgets/footer/footer_controller.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    return MultiProvider(
      providers: [
        // Others
        Provider<Dio>(create: (_) => Dio()),
        Provider<SpeechToText>(create: (_) => SpeechToText()),

        // Repositories
        ProxyProvider<Dio, MessageRepository>(update: (_, dio, __) => MessageRepository(dio)),

        // Controllers
        ProxyProvider<MessageRepository, HomeController>(update: (_, messageRepository, __) => HomeController(messageRepository)),
        ProxyProvider2<SpeechToText, HomeController, FooterController>(update: (_, speechToText, homeController, __) => FooterController(speechToText, homeController)),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: HomePage(),
      ),
    );
  }
}
