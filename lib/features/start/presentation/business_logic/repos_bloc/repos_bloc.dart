import 'package:github_repo/features/start/export/start_export.dart';

part 'repos_event.dart';

part 'repos_state.dart';

class ReposBloc extends Bloc<BaseReposEvent, ReposState> {
  GetReposUseCase getReposUseCase;
  SearchReposUseCase searchReposUseCase;
  TextEditingController controller = TextEditingController();

  ReposBloc(this.getReposUseCase, this.searchReposUseCase)
      : super(const ReposState()) {
    on<GetReposEvent>(_getRepos);
    on<ToggleSearchAndCloseEvent>(_toggleSearchAndClose);
    on<SearchReposEvent>(_searchRepos,
        transformer: (events, mapper) => events
            .debounceTime(const Duration(milliseconds: 1500))
            .switchMap(mapper));
  }

  FutureOr<void> _getRepos(
      GetReposEvent event, Emitter<ReposState> emit) async {
    emit(state.copyWith(status: ReposStatus.loading, repos: state.repos));
    final result = await getReposUseCase(const NoParameters());
    if (result.$1 != null) {
      emit(
          state.copyWith(status: ReposStatus.error, error: result.$1!.message));
    } else {
      emit(state.copyWith(status: ReposStatus.success, repos: result.$2));
    }
  }

  FutureOr<void> _searchRepos(
      SearchReposEvent event, Emitter<ReposState> emit) async {
    emit(state.copyWith(status: ReposStatus.loading, repos: state.repos));
    final result = await searchReposUseCase(
        SearchReposParameters(query: event.query, sort: event.sort));
    if (result.$1 != null) {
      emit(
          state.copyWith(status: ReposStatus.error, error: result.$1!.message));
    } else {
      emit(state.copyWith(status: ReposStatus.success, repos: result.$2));
    }
  }

  FutureOr<void> _toggleSearchAndClose(
      ToggleSearchAndCloseEvent event, Emitter<ReposState> emit) {
    emit(state.copyWith(isSearchActive: !state.isSearchActive));
  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}
