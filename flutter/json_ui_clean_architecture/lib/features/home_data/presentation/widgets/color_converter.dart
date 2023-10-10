import 'dart:ui';

Color colorConverter(String convColor) {
  return Color(int.parse(convColor!.replaceAll("#", "0XFF")));
}
