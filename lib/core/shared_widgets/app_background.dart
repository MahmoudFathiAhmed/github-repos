import 'package:flutter/material.dart';
import 'package:github_repo/core/utils/assets_manager.dart';

class AppBackground extends StatelessWidget {
  final Widget child;

  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageAssets.background), fit: BoxFit.cover)),
      child: child,
    );
  }
}
