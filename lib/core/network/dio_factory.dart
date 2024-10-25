import 'package:github_repo/core/network/network_constants.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String applicationJson = 'application/json';
const String contentType = 'content-type';
const String accept = 'accept';

class DioFactory {
  DioFactory();

  Future<Dio> getDio({String? baseUrl}) async {
    Dio dio = Dio();
    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
    };

    dio.options = BaseOptions(
      baseUrl: baseUrl ?? NetworkConstants.baseUrl,
      receiveDataWhenStatusError: true,
      headers: headers,
      receiveTimeout: const Duration(milliseconds: NetworkConstants.apiTimeOut),
      // sendTimeout: const Duration(milliseconds: NetworkConstants.apiTimeOut)
    );

    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true, requestBody: true, responseHeader: true));
    return dio;
  }
}
