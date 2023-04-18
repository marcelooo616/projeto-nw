import 'package:flutter/material.dart';
 /*
 * Nesse exemplo, criamos uma classe AppColors com cinco cores definidas como static const.
 *  A primeira cor primaryColor é definida como a cor principal do seu aplicativo,
 *  enquanto accentColor é uma cor de destaque. As outras cores são definidas como secondaryColor,
 *  greyColor e backgroundColor.
 * */

class AppColors {
  static const Color primaryColor = Color(0xFF000000);
  static const Color backgroundDark = Color(0xFF171716);
  static const Color backgroundDark2 = Color(0xFF1E1E1E);
  static const Color backgroundDarkGreen = Color(0xFFA8F362);
  static const Color accentColor = Color(0xFFC1E800);
  static const Color secondaryColor = Color(0xFFD4FF00);
  static const Color greyColor = Color(0xFFCECECE);
  static const Color backgroundColor = Color(0xFFFAFDF6);

  static const MaterialColor appPrimaryColor = MaterialColor(
    0xFF111400,
    <int, Color>{
      50: Color(0xFF111400),
      100: Color(0xFF111400),
      200: Color(0xFF111400),
      300: Color(0xFF111400),
      400: Color(0xFF111400),
      500: Color(0xFF111400),
      600: Color(0xFF111400),
      700: Color(0xFF111400),
      800: Color(0xFF111400),
      900: Color(0xFF111400),
    },
  );

  static const MaterialColor appBackgroundDark2 = MaterialColor(
    0xFF1E1E1E,
    <int, Color>{
      50: Color(0xFF1E1E1E),
      100: Color(0xFF1E1E1E),
      200: Color(0xFF1E1E1E),
      300: Color(0xFF1E1E1E),
      400: Color(0xFF1E1E1E),
      500: Color(0xFF1E1E1E),
      600: Color(0xFF1E1E1E),
      700: Color(0xFF1E1E1E),
      800: Color(0xFF1E1E1E),
      900: Color(0xFF1E1E1E),
    },
  );




}