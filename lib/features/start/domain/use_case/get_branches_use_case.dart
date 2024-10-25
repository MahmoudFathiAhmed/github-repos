import 'package:github_repo/features/start/export/start_export.dart';

class GetBranchesUseCase extends BaseUseCase<List<Branch>, BranchesParameters> {
  final BaseStartRepository baseStartRepository;

  GetBranchesUseCase(this.baseStartRepository);

  @override
  Future<(Failure?, List<Branch>?)> call(BranchesParameters parameters) async {
    return await baseStartRepository.getBranches(parameters);
  }
}

class BranchesParameters {
  final String url;

  BranchesParameters({required this.url});
}
