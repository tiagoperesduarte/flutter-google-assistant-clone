import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutterdialogflow/app/utils/string_utils.dart';
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
      child: Column(
        children: <Widget>[
          Observer(
            builder: (BuildContext context) {
              if (StringUtils.isEmpty(_footerController.recognizedWords)) {
                return Container();
              }

              return Container(
                padding: EdgeInsets.only(
                  bottom: 15,
                ),
                alignment: Alignment.centerRight,
                child: Text(
                  _footerController.recognizedWords,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              );
            },
          ),
          Row(
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
                            onTap: _footerController.toggleRecognition,
                            child: Observer(
                              builder: (_) {
                                if (_footerController.inRecognition) {
                                  return Lottie.asset(
                                    "assets/lottiefiles/voice_recorder.json",
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
        ],
      ),
    );
  }
}
