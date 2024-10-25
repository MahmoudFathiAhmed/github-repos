import 'package:flutter/material.dart';
import 'package:github_repo/core/utils/values_manager.dart';

class ColorsManager {
  //basics colors
  static const Color white = Color(0xffFFFFFF);
  static const Color black = Color(0xff000000);
  static const Color trans = Color(0x00000000);

  //app colors
  static const Color appBarTitleColor = Color(0xFF45464E);
  static const Color darkGrey = Color(0xFF2C2D33);
  static const Color iconColor = Color(0xFF112433);
  static Color primaryColor =
      const Color(0xFF5570F1).withOpacity(AppDouble.d0_16);
  static Color purple = const Color(0xFF5570F1);
}
