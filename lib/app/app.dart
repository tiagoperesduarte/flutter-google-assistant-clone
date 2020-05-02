import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterdialogflow/app/pages/home_controller.dart';
import 'package:flutterdialogflow/app/pages/home_page.dart';
import 'package:flutterdialogflow/app/widgets/footer/footer_controller.dart';
import 'package:flutterdialogflow/app/widgets/message_list/message_list_controller.dart';
import 'package:provider/provider.dart';

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
        Provider<FooterController>(create: (_) => FooterController()),
        Provider<MessageListController>(create: (_) => MessageListController()),
        Provider<HomeController>(create: (_) => HomeController()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: HomePage(),
      ),
    );
  }
}
