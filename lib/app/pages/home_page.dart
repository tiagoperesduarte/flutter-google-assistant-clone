import 'package:flutter/material.dart';
import 'package:flutterdialogflow/app/pages/home_controller.dart';
import 'package:flutterdialogflow/app/widgets/footer/footer_widget.dart';
import 'package:flutterdialogflow/app/widgets/message_list/message_list_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _homeController = Provider.of<HomeController>(context);

    return Scaffold(
      body: Column(
        children: <Widget>[
          MessageListWidget(),
          FooterWidget(),
        ],
      ),
    );
  }
}
