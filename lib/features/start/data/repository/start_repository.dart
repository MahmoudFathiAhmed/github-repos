import 'package:github_repo/features/start/domain/use_case/get_branches_use_case.dart';
import 'package:github_repo/features/start/export/start_export.dart';

class StartRepository extends BaseStartRepository {
  final BaseStartRemoteDataSource baseStartRemoteDataSource;

  StartRepository(this.baseStartRemoteDataSource);

  @override
  Future<(Failure?, List<Repo>?)> getRepos(NoParameters parameters) async {
    try {
      final result = await baseStartRemoteDataSource.getRepos(parameters);
      return (null, result);
    } on DioException catch (error) {
      return (ErrorHandler.handle(error).failure, null);
    }
  }

  @override
  Future<(Failure?, List<Repo>?)> searchRepos(
      SearchReposParameters parameters) async {
    try {
      final result = await baseStartRemoteDataSource.searchRepos(parameters);
      return (null, result);
    } on DioException catch (error) {
      return (ErrorHandler.handle(error).failure, null);
    }
  }

  @override
  Future<(Failure?, List<Branch>?)> getBranches(
      BranchesParameters parameters) async {
    try {
      final result = await baseStartRemoteDataSource.getBranches(parameters);
      return (null, result);
    } on DioException catch (error) {
      return (ErrorHandler.handle(error).failure, null);
    }
  }
}
