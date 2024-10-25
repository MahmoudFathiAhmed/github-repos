import 'package:github_repo/features/start/domain/use_case/get_branches_use_case.dart';
import 'package:github_repo/features/start/export/start_export.dart';

abstract class BaseStartRepository {
  Future<(Failure?, List<Repo>?)> getRepos(NoParameters parameters);

  Future<(Failure?, List<Repo>?)> searchRepos(SearchReposParameters parameters);

  Future<(Failure?, List<Branch>?)> getBranches(BranchesParameters parameters);
}
