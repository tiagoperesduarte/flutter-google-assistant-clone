import 'package:flutter/material.dart';
import 'package:fluttergoogleassistantclone/app/utils/list_utils.dart';
import 'package:random_color/random_color.dart';

class ColorUtils {
  static RandomColor _randomColor = RandomColor();

  static List<String> _defaultHexColors = List.of([
    "#7cb5ec",
    "#434348",
    "#90ed7d",
    "#f7a35c",
    "#8085e9",
    "#f15c80",
    "#e4d354",
    "#2b908f",
    "#f45b5b",
    "#91e8e1",
  ]);

  static Color fromHex(String hexColor) {
    return Color(int.parse(hexColor.replaceAll('#', '0xFF')));
  }

  static Color defaultOrRandomColor(int index) {
    if (ListUtils.indexExists(_defaultHexColors, index)) {
      return fromHex(_defaultHexColors[index]);
    }

    return _randomColor.randomColor();
  }

  static Color randomColor() {
    return _randomColor.randomColor();
  }

  static Color randomLightColor() {
    return _randomColor.randomColor(
      colorBrightness: ColorBrightness.light,
    );
  }

  static Color randomDarkColor() {
    return _randomColor.randomColor(
      colorBrightness: ColorBrightness.dark,
    );
  }
}
