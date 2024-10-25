import 'package:github_repo/features/start/domain/use_case/get_branches_use_case.dart';
import 'package:github_repo/features/start/export/start_export.dart';

part 'branches_state.dart';

class BranchesCubit extends Cubit<BranchesState> {
  GetBranchesUseCase getBranchesUseCase;

  BranchesCubit(this.getBranchesUseCase) : super(const BranchesState());

  Future<void> getBranches(String url) async {
    emit(state.copyWith(
        status: BranchesStatus.loading, branches: state.branches));
    final result = await getBranchesUseCase(BranchesParameters(url: url));
    if (result.$1 != null) {
      emit(state.copyWith(
          status: BranchesStatus.error, error: result.$1!.message));
    } else {
      emit(state.copyWith(status: BranchesStatus.success, branches: result.$2));
    }
  }
}
