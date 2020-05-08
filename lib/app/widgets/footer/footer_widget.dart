import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttergoogleassistantclone/app/utils/list_utils.dart';
import 'package:fluttergoogleassistantclone/app/utils/string_utils.dart';
import 'package:fluttergoogleassistantclone/app/widgets/footer/footer_controller.dart';
import 'package:fluttergoogleassistantclone/app/widgets/suggestion_chip/suggestion_chip.dart';
import 'package:lottie/lottie.dart';

class FooterWidget extends StatelessWidget {
  final FooterController controller;

  FooterWidget({
    this.controller,
    void Function(String value) onSubmitted,
  }) {
    this.controller.onSubmitted = onSubmitted;
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildSuggestionChips() {
      return Observer(
        builder: (BuildContext context) {
          if (ListUtils.isEmpty(controller.suggestionChips)) {
            return Container();
          }

          return Container(
            height: 40,
            margin: EdgeInsets.only(
              top: 8,
            ),
            child: ListView.separated(
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: controller.suggestionChips.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 8);
              },
              itemBuilder: (BuildContext context, int index) {
                return SuggestionChip(controller.suggestionChips[index]);
              },
            ),
          );
        },
      );
    }

    Widget _buildRecognizedWords() {
      return Observer(
        builder: (BuildContext context) {
          if (!controller.inRecognition || StringUtils.isEmpty(controller.recognizedWords)) {
            return Container();
          }

          return Container(
            margin: EdgeInsets.only(
              top: 15,
            ),
            padding: EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            alignment: Alignment.centerRight,
            child: Text(
              controller.recognizedWords,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          );
        },
      );
    }

    return Container(
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
          _buildSuggestionChips(),
          _buildRecognizedWords(),
          Container(
            margin: EdgeInsets.all(15),
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
                              onTap: controller.toggleRecognition,
                              child: Observer(
                                builder: (_) {
                                  if (controller.inRecognition) {
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
          ),
        ],
      ),
    );
  }
}
