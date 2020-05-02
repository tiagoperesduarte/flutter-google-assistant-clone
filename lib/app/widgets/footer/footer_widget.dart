import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutterdialogflow/app/widgets/footer/footer_controller.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class FooterWidget extends StatefulWidget {
  @override
  _FooterWidgetState createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  @override
  Widget build(BuildContext context) {
    final _footerController = Provider.of<FooterController>(context);

    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 2,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Row(
        children: <Widget>[
          Container(
            child: IconButton(
              icon: Icon(Icons.home),
              color: Colors.grey,
              onPressed: () {},
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.only(
                  left: 8,
                  right: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3,
                      offset: Offset(0, 1),
                    )
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.filter_center_focus),
                      color: Colors.grey,
                      onPressed: () {},
                    ),
                    SizedBox(
                      width: 65,
                      child: GestureDetector(
                        onTap: _footerController.initSpeechToText,
                        child: Observer(
                          builder: (_) {
                            if (_footerController.hasSpeech) {
                              return Lottie.asset(
                                "assets/lottiefiles/voice_recognition.json",
                                height: 48,
                              );
                            }

                            return Icon(
                              Icons.mic,
                              size: 32,
                              color: Colors.blue,
                            );
                          },
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.keyboard),
                      color: Colors.grey,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: IconButton(
              icon: Icon(Icons.menu),
              color: Colors.grey,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
