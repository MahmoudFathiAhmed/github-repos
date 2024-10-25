import 'package:github_repo/features/start/export/start_export.dart';

class BranchItem extends StatelessWidget {
  final Branch branch;

  const BranchItem({super.key, required this.branch});

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(maxWidth: double.maxFinite),
        padding: EdgeInsets.all(AppDouble.d8.r),
        width: double.infinity,
        decoration: ShapeDecoration(
          color: ColorsManager.primaryColor,
          shape: const StadiumBorder(),
        ),
        child: Text(
          '${StringsManager.branch}${branch.name ?? ''}',
          style: TextStyles.font14DarkGreySemiBold(color: ColorsManager.purple),
          maxLines: AppInt.i1,
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
        ));
  }
}
