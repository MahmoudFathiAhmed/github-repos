part of 'repos_bloc.dart';

enum ReposStatus { initial, loading, success, error }

extension ReposStatusX on ReposState {
  bool get isInitial => status == ReposStatus.initial;

  bool get isLoading => status == ReposStatus.loading;

  bool get isSuccess => status == ReposStatus.success;

  bool get isError => status == ReposStatus.error;
}

class ReposState extends Equatable {
  final ReposStatus status;
  final List<Repo>? repos;
  final String? error;
  final bool isSearchActive;

  const ReposState(
      {this.status = ReposStatus.initial,
      this.repos,
      this.error,
      this.isSearchActive = false});

  ReposState copyWith(
      {ReposStatus? status,
      List<Repo>? repos,
      String? error,
      bool? isSearchActive}) {
    return ReposState(
        status: status ?? this.status,
        repos: repos ?? this.repos,
        error: error ?? this.error,
        isSearchActive: isSearchActive ?? this.isSearchActive);
  }

  @override
  List<Object?> get props => [status, repos, error, isSearchActive];
}
