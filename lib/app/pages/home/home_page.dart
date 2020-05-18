import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttergoogleassistantclone/app/pages/home/home_controller.dart';
import 'package:fluttergoogleassistantclone/app/utils/string_utils.dart';
import 'package:fluttergoogleassistantclone/app/widgets/footer/footer_widget.dart';
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
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Color(0xFFFCFDFC),
                child: FutureBuilder(
                  future: _homeController.loadMessages(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return Observer(
                      builder: (BuildContext context) => ListView.separated(
                        padding: EdgeInsets.all(16),
                        itemCount: _homeController.messages.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 8);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return _homeController.messages[index].toWidget();
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            FooterWidget(
              controller: _homeController.footerController,
              onSubmitted: (String value) {
                if (StringUtils.isEmpty(value)) {
                  return;
                }

                _homeController.process(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
