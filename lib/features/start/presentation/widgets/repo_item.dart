import 'package:github_repo/features/start/export/start_export.dart';

class RepoItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String owner;
  final VoidCallback? onTap;

  const RepoItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.owner,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          ImageViewWidget(
            width: AppDouble.d50.w,
            cellAspectRatio: AppDouble.d1,
            imageUrl: imageUrl,
            borderRadius: BorderRadius.circular(AppDouble.d10.r),
          ),
          SizedBox(width: AppDouble.d14.w),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${StringsManager.name}$name',
                  style: TextStyles.font14DarkGreySemiBold(),
                  maxLines: AppInt.i1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: AppDouble.d10.h),
                Text(
                  '${StringsManager.owner}$owner',
                  style: TextStyles.font14DarkGreyRegular(),
                  maxLines: AppInt.i1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
