import 'package:github_repo/features/start/domain/use_case/get_branches_use_case.dart';
import 'package:github_repo/features/start/export/start_export.dart';

abstract class BaseStartRemoteDataSource extends BaseAppRemoteDataSource {
  Future<List<Repo>> getRepos(NoParameters parameters);

  Future<List<Repo>> searchRepos(SearchReposParameters parameters);

  Future<List<Branch>> getBranches(BranchesParameters parameters);
}

class StartRemoteDataSource extends BaseStartRemoteDataSource {
  @override
  Future<List<Repo>> getRepos(NoParameters parameters) async {
    return await makeApiCall(
        url: NetworkConstants.getRepositories,
        method: HttpMethod.get,
        fromJson: (data) =>
            data.map<Repo>((post) => Repo.fromJson(post)).toList());
  }

  @override
  Future<List<Repo>> searchRepos(SearchReposParameters parameters) async {
    return await makeApiCall(
        url: NetworkConstants.searchRepositories,
        method: HttpMethod.get,
        queryParams: parameters.toJson(),
        fromJson: (data) =>
            data["items"].map<Repo>((post) => Repo.fromJson(post)).toList());
  }

  @override
  Future<List<Branch>> getBranches(BranchesParameters parameters) async {
    return await makeApiCall(
        url: parameters.url,
        method: HttpMethod.get,
        fromJson: (data) =>
            data.map<Branch>((post) => Branch.fromJson(post)).toList());
  }
}
