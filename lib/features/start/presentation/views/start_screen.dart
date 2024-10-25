import 'package:github_repo/features/start/export/start_export.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ReposBloc(getIt.get(), getIt.get())..add(const GetReposEvent()),
      child: BlocBuilder<ReposBloc, ReposState>(
        builder: (reposContext, reposState) {
          ReposBloc reposBloc = reposContext.read<ReposBloc>();
          return Scaffold(
            appBar: StartAppBar(
              isSearch: reposState.isSearchActive,
              searchOnTap: () {
                reposBloc.add(const ToggleSearchAndCloseEvent());
              },
              onFilterSelected: (selectedFilter) {
                if (reposBloc.controller.text.isNotEmpty) {
                  reposBloc.add(SearchReposEvent(
                      sort: selectedFilter, query: reposBloc.controller.text));
                }
              },
              title: reposState.isSearchActive
                  ? TextField(
                      onTapOutside: (event) =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                            onPressed: () {
                              reposBloc.controller.clear();
                            },
                            icon: const Icon(Icons.close)),
                      ),
                      controller: reposBloc.controller,
                      onChanged: (query) {
                        if (query.isNotEmpty) {
                          reposBloc.add(SearchReposEvent(query: query));
                        }
                      },
                    )
                  : null,
            ),
            body: AppBackground(
              child: BlocConsumer<ReposBloc, ReposState>(
                bloc: reposBloc,
                listener: (context, state) {
                  if (state.isError) {
                    showAppSnackBar(context, content: state.error!);
                  }
                },
                builder: (reposContext, reposState) {
                  if (reposState.isLoading || reposState.isInitial) {
                    return const AppLoadingWidget();
                  }
                  final List<Repo> repos = reposState.repos ?? [];
                  if (repos.isEmpty) {
                    return const Center(
                        child: Text(StringsManager.noReposFound));
                  } else {
                    return RefreshIndicator(
                      onRefresh: () async {
                        reposBloc.add(const GetReposEvent());
                      },
                      child: StartListViewContainer(
                        child: ListView.separated(
                          physics: const AlwaysScrollableScrollPhysics(),
                          separatorBuilder: (context, index) =>
                              const StartDivider(),
                          padding: EdgeInsets.all(AppDouble.d20.r),
                          itemCount: repos.length,
                          itemBuilder: (context, index) {
                            return RepoItem(
                              imageUrl: repos[index].owner!.avatarUrl!,
                              name: repos[index].name!,
                              owner: repos[index].owner!.login!,
                              onTap: () {
                                showBranchesBottomSheet(
                                  context: context,
                                  url: repos[index]
                                      .branchesUrl!
                                      .omitBranchPattern(),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
