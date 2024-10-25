import 'package:github_repo/core/shared_widgets/popup_menu_button.dart';
import 'package:github_repo/features/start/export/start_export.dart';

class StartAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final VoidCallback? searchOnTap;
  final Function(String) onFilterSelected;

  final bool isSearch;

  const StartAppBar({
    super.key,
    this.title,
    this.searchOnTap,
    required this.onFilterSelected,
    required this.isSearch,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: AppDouble.d56.w,
      leading: Padding(
          padding: EdgeInsetsDirectional.only(start: AppDouble.d24.w),
          child: CustomPopupMenuButton<String>(
            onSelected: onFilterSelected,
            items: const [
              CustomPopupMenuItem<String>(
                value: StringsManager.updated,
                child: Text(StringsManager.updated),
              ),
              CustomPopupMenuItem<String>(
                value: StringsManager.stars,
                child: Text(StringsManager.stars),
              ),
              CustomPopupMenuItem<String>(
                  value: StringsManager.authorDateValue,
                  child: Text(StringsManager.authorDate)),
              CustomPopupMenuItem<String>(
                  value: StringsManager.committerDateValue,
                  child: Text(StringsManager.committerDate)),
            ],
            child: const SvgIcon(
              color: ColorsManager.darkGrey,
              assetName: ImageAssets.filter,
              height: AppDouble.d15,
              width: AppDouble.d17,
            ),
          )),
      title: title ?? const Text(StringsManager.githubRepo),
      actions: [
        Padding(
          padding: EdgeInsetsDirectional.only(end: AppDouble.d29.w),
          child: InkWell(
              borderRadius: BorderRadius.circular(AppDouble.d7),
              onTap: searchOnTap,
              child: isSearch
                  ? const Icon(Icons.arrow_forward_ios_rounded)
                  : const SvgIcon(
                      color: ColorsManager.darkGrey,
                      assetName: ImageAssets.search,
                      height: AppDouble.d15,
                      width: AppDouble.d15,
                    )),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
