import 'dart:ui';
import 'package:github_repo/features/start/export/start_export.dart';

class StartListViewContainer extends StatelessWidget {
  final Widget child;

  const StartListViewContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppDouble.d12.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: AppDouble.d20, sigmaY: AppDouble.d20),
        child: Container(
          margin: EdgeInsetsDirectional.only(
              start: AppDouble.d20.w,
              end: AppDouble.d20.w,
              top: AppDouble.d14.h),
          decoration: BoxDecoration(
            color: ColorsManager.white.withOpacity(AppDouble.d0_5),
            borderRadius: BorderRadius.circular(AppDouble.d12.r),
            border: Border.all(
                color: ColorsManager.white.withOpacity(AppDouble.d0_35),
                width: AppDouble.d1.r),
          ),
          child: child,
        ),
      ),
    );
  }
}
