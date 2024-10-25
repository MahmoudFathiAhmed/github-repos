import 'package:github_repo/features/start/export/start_export.dart';

class StartDivider extends StatelessWidget {
  const StartDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: ColorsManager.white,
      height: AppDouble.d24.h,
      thickness: AppDouble.d1,
    );
  }
}
