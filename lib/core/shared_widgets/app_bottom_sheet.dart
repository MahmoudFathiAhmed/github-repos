import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:github_repo/core/extensions/extenstions.dart';
import 'package:github_repo/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

Future<dynamic> buildAppBottomSheet(
  BuildContext context, {
  required Widget content,
  Color? backgroundColor,
  double radius = AppDouble.d12,
  bool isDismissible = true,
  double heightFactor = AppDouble.d0_5,
}) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: backgroundColor,
    isDismissible: isDismissible,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(radius.r),
        topRight: Radius.circular(radius.r),
      ),
    ),
    constraints: BoxConstraints(
      maxWidth: context.width,
      minWidth: context.width,
    ),
    builder: (context) =>
        FractionallySizedBox(heightFactor: heightFactor, child: content),
  );
}
