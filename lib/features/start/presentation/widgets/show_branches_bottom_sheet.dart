import 'package:github_repo/features/start/export/start_export.dart';

showBranchesBottomSheet({required BuildContext context, required String url}) {
  buildAppBottomSheet(
    context,
    content: BranchesContent(url: url),
  );
}

class BranchesContent extends StatelessWidget {
  final String url;

  const BranchesContent({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BranchesCubit(getIt.get())..getBranches(url),
      child: BlocConsumer<BranchesCubit, BranchesState>(
        listener: (branchesContext, branchesState) {
          if (branchesState.isError) {
            showAppSnackBar(context, content: branchesState.error!);
          }
        },
        builder: (branchesContext, branchesState) {
          if (branchesState.isLoading || branchesState.isInitial) {
            return const AppLoadingWidget();
          }
          List<Branch> branches = branchesState.branches ?? [];
          if (branches.isNotEmpty) {
            return ListView.separated(
                padding: EdgeInsets.all(AppDouble.d16.r),
                separatorBuilder: (context, index) => const StartDivider(),
                itemCount: branches.length,
                itemBuilder: (context, index) => BranchItem(
                      branch: branches[index],
                    ));
          } else {
            return const Center(child: Text(StringsManager.noBranchesFound));
          }
        },
      ),
    );
  }
}
