import 'package:github_repo/features/start/export/start_export.dart';

class GetReposUseCase extends BaseUseCase<List<Repo>, NoParameters> {
  final BaseStartRepository baseStartRepository;

  GetReposUseCase(this.baseStartRepository);

  @override
  Future<(Failure?, List<Repo>?)> call(NoParameters parameters) async {
    return await baseStartRepository.getRepos(parameters);
  }
}
