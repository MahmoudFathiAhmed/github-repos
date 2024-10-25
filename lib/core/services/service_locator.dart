import 'package:get_it/get_it.dart';
import 'package:github_repo/core/network/dio_factory.dart';

import 'package:github_repo/features/start/data/datasource/remote/start_remote_data_source.dart';
import 'package:github_repo/features/start/data/repository/start_repository.dart';
import 'package:github_repo/features/start/domain/repository/base_start_repository.dart';
import 'package:github_repo/features/start/domain/use_case/get_branches_use_case.dart';
import 'package:github_repo/features/start/domain/use_case/get_repos_use_case.dart';
import 'package:github_repo/features/start/domain/use_case/search_repos_use_case.dart';
import 'package:github_repo/features/start/presentation/business_logic/branches_cubit/branches_cubit.dart';
import 'package:github_repo/features/start/presentation/business_logic/repos_bloc/repos_bloc.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  void init() async {
    ///Dio Factory
    getIt.registerLazySingleton<DioFactory>(() => DioFactory());

    /// USE CASES
    getIt.registerLazySingleton(() => GetReposUseCase(getIt()));
    getIt.registerLazySingleton(() => SearchReposUseCase(getIt()));
    getIt.registerLazySingleton(() => GetBranchesUseCase(getIt()));

    /// REPOSITORIES
    getIt.registerLazySingleton<BaseStartRepository>(
        () => StartRepository(getIt()));

    ///DATA SOURCES
    getIt.registerLazySingleton<BaseStartRemoteDataSource>(
        () => StartRemoteDataSource());

    /// BLOCS
    getIt.registerFactory(() => ReposBloc(getIt(), getIt()));
    getIt.registerFactory(() => BranchesCubit(getIt()));
  }
}
