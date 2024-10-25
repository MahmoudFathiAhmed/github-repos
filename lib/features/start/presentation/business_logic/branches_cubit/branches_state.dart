part of 'branches_cubit.dart';

enum BranchesStatus { initial, loading, success, error }

extension BranchesStatusX on BranchesState {
  bool get isInitial => status == BranchesStatus.initial;

  bool get isLoading => status == BranchesStatus.loading;

  bool get isSuccess => status == BranchesStatus.success;

  bool get isError => status == BranchesStatus.error;
}

class BranchesState extends Equatable {
  final BranchesStatus status;
  final List<Branch>? branches;
  final String? error;

  const BranchesState({
    this.status = BranchesStatus.initial,
    this.branches,
    this.error,
  });

  BranchesState copyWith(
      {BranchesStatus? status, List<Branch>? branches, String? error}) {
    return BranchesState(
        status: status ?? this.status,
        branches: branches ?? this.branches,
        error: error ?? this.error);
  }

  @override
  List<Object?> get props => [status, branches, error];
}
