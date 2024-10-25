import 'package:github_repo/core/network/dio_factory.dart';
import 'package:github_repo/core/services/service_locator.dart';

abstract class BaseAppRemoteDataSource {
  late DioFactory dio;

  BaseAppRemoteDataSource() {
    dio = getIt.get<DioFactory>();
  }
}
