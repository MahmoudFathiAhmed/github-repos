import 'package:github_repo/features/start/export/start_export.dart';

class SearchReposUseCase
    extends BaseUseCase<List<Repo>, SearchReposParameters> {
  final BaseStartRepository baseStartRepository;

  SearchReposUseCase(this.baseStartRepository);

  @override
  Future<(Failure?, List<Repo>?)> call(SearchReposParameters parameters) async {
    return await baseStartRepository.searchRepos(parameters);
  }
}

class SearchReposParameters {
  final String query;
  final String? sort;

  SearchReposParameters({this.sort, required this.query});

  Map<String, dynamic> toJson() => {
        "q": query,
        "sort": sort ?? "indexed",
      };
}
