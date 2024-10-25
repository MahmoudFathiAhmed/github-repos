import 'package:github_repo/core/shared_widgets/ripple_loading.dart';
import 'package:github_repo/core/utils/colors_manager.dart';
import 'package:github_repo/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: RippleLoading(
      radius: AppDouble.d40,
      color: ColorsManager.primaryColor,
    ));
  }
}
