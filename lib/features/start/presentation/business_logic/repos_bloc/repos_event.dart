part of 'repos_bloc.dart';

abstract class BaseReposEvent extends Equatable {
  const BaseReposEvent();
}

class GetReposEvent extends BaseReposEvent {
  const GetReposEvent();

  @override
  List<Object> get props => [];
}

class SearchReposEvent extends BaseReposEvent {
  final String query;
  final String? sort;

  const SearchReposEvent({required this.query, this.sort});

  @override
  List<Object> get props => [query];
}

class ToggleSearchAndCloseEvent extends BaseReposEvent {
  const ToggleSearchAndCloseEvent();

  @override
  List<Object?> get props => [];
}
