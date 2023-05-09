import 'package:flutter/material.dart';

class FlutterIconData extends IconData {
  const FlutterIconData(int codePoint, String fontFamily)
      : super(codePoint, fontFamily: fontFamily);

  const FlutterIconData.ionicons(int codePoint) : this(codePoint, "Ionicons");

  const FlutterIconData.antDesign(int codePoint) : this(codePoint, "AntDesign");

  const FlutterIconData.fontAwesome(int codePoint)
      : this(codePoint, "FontAwesome");

  const FlutterIconData.fontAwesome5Brands(int codePoint)
      : this(codePoint, "FontAwesome5_Brands");

  const FlutterIconData.fontAwesome5(int codePoint)
      : this(codePoint, "FontAwesome5");

  const FlutterIconData.fontAwesome5Solid(int codePoint)
      : this(codePoint, "FontAwesome5_Solid");

  const FlutterIconData.entypo(int codePoint) : this(codePoint, "Entypo");

  const FlutterIconData.evilIcons(int codePoint) : this(codePoint, "EvilIcons");

  const FlutterIconData.feather(int codePoint) : this(codePoint, "Feather");

  const FlutterIconData.foundation(int codePoint)
      : this(codePoint, "Foundation");

  const FlutterIconData.materialCommunityIcons(int codePoint)
      : this(codePoint, "MaterialCommunityIcons");

  const FlutterIconData.materialIcons(int codePoint)
      : this(codePoint, "MaterialIcons");

  const FlutterIconData.octicons(int codePoint) : this(codePoint, "Octicons");

  const FlutterIconData.simpleLineIcons(int codePoint)
      : this(codePoint, "SimpleLineIcons");

  const FlutterIconData.zocial(int codePoint) : this(codePoint, "Zocial");

  const FlutterIconData.weatherIcons(int codePoint)
      : this(codePoint, "WeatherIcons");
}

class FlutterIcons {
  static const IconData keyboard_backspace_mdi =
      const FlutterIconData.materialIcons(58135);
  static const IconData caret_down_faw =
      const FlutterIconData.fontAwesome(61655);
  static const IconData caret_up_faw = const FlutterIconData.fontAwesome(61656);
  static const IconData plus_fea = const FlutterIconData.feather(59825);
  static const IconData x_fea = const FlutterIconData.feather(59906);
}
