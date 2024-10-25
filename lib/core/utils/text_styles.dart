import 'package:flutter/material.dart';
import 'package:github_repo/core/utils/colors_manager.dart';
import 'package:github_repo/core/utils/font_manager.dart';
import 'package:github_repo/core/utils/styles_manager.dart';

class TextStyles {
  static TextStyle font14DarkGreySemiBold(
      {double size = FontSize.s14, color = ColorsManager.darkGrey}) {
    return getSemiBoldStyle(color: color, fontSize: size);
  }

  static TextStyle font14DarkGreyRegular(
      {double size = FontSize.s14, color = ColorsManager.darkGrey}) {
    return getRegularStyle(color: color, fontSize: size);
  }
}
