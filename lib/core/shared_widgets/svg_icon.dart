import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SvgIcon extends StatelessWidget {
  final Color color;
  final double? width;
  final double? height;
  final String assetName;

  const SvgIcon({
    super.key,
    required this.color,
    this.width,
    this.height,
    required this.assetName,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      height: height?.h,
      width: width?.h,
      colorFilter: ColorFilter.mode(
        color,
        BlendMode.srcIn,
      ),
    );
  }
}
