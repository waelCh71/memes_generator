import 'package:dio/dio.dart';

import '../../global/utils/constants.dart';

class DioInstance {
  
  late Dio dio;
  //DioInstance();
  Dio webServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseURL,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
    );
    return dio= Dio(options);
  }
}
