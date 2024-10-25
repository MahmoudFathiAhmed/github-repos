import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_repo/core/utils/colors_manager.dart';
import 'package:github_repo/core/utils/font_manager.dart';
import 'package:github_repo/core/utils/styles_manager.dart';
import 'package:github_repo/core/utils/values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //main colors
    primaryColor: ColorsManager.primaryColor,
    fontFamily: FontConstants.interFontFamily,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsManager.primaryColor,
      primary: ColorsManager.primaryColor,
    ),
    scaffoldBackgroundColor: ColorsManager.white,
    useMaterial3: true,
    //app bar theme
    appBarTheme: AppBarTheme(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: ColorsManager.black,
            statusBarIconBrightness: Brightness.light),
        color: ColorsManager.white,
        elevation: AppDouble.d0,
        centerTitle: true,
        toolbarTextStyle: getMediumStyle(
            color: ColorsManager.appBarTitleColor,
            fontSize: FontSize.s20,
            fontFamily: FontConstants.poppinsFontFamily),
        iconTheme: const IconThemeData(color: ColorsManager.iconColor),
        titleTextStyle: getMediumStyle(
            color: ColorsManager.appBarTitleColor,
            fontSize: FontSize.s20,
            fontFamily: FontConstants.poppinsFontFamily)),
    //button theme
    buttonTheme: ButtonThemeData(
      disabledColor: ColorsManager.white,
      buttonColor: ColorsManager.primaryColor,
      splashColor: ColorsManager.white,
    ),
    iconTheme: const IconThemeData(
      color: ColorsManager.iconColor,
    ),
    bottomSheetTheme: BottomSheetThemeData(
        // backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(AppDouble.d12.r),
        topRight: Radius.circular(AppDouble.d12.r),
      ),
    )),
    popupMenuTheme: PopupMenuThemeData(
      color: ColorsManager.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDouble.d4.r),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
        hintStyle:
            getRegularStyle(color: ColorsManager.black, fontSize: FontSize.s15),
        contentPadding: const EdgeInsets.all(AppDouble.d8),
        errorStyle: getLightStyle(
          color: Colors.red,
          fontSize: FontSize.s12,
        ),
        prefixIconColor: ColorsManager.iconColor,
        suffixIconColor: ColorsManager.iconColor,
        disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: AppDouble.d1),
            borderRadius: BorderRadius.all(Radius.circular(AppDouble.d20))),
        focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: AppDouble.d1),
            borderRadius: BorderRadius.all(Radius.circular(AppDouble.d20))),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: AppDouble.d1),
            borderRadius: BorderRadius.all(Radius.circular(AppDouble.d20))),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: AppDouble.d1),
            borderRadius: BorderRadius.all(Radius.circular(AppDouble.d20))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: AppDouble.d1),
            borderRadius: BorderRadius.all(Radius.circular(AppDouble.d20)))),
  );
}
