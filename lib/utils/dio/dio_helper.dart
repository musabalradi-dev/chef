import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://127.0.0.1:8000/api/',
        receiveDataWhenStatusError: true,
        connectTimeout: Duration(seconds: 3),
        receiveTimeout: Duration(seconds: 3),
        sendTimeout: Duration(seconds: 5),
      ),
    );
  }

  static Future<Response> getData({
    required String endpoint,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    return await dio!.get(
      endpoint,
      queryParameters: query,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }

  static Future<Response> postData({
    required String endpoint,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    return await dio!.post(
      endpoint,
      data: data,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }

  static Future<Response> putData({
    required String endpoint,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    return await dio!.put(
      endpoint,
      data: data,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }

  static Future<Response> deleteData({
    required String endpoint,
    String? token,
  }) async {
    return await dio!.delete(
      endpoint,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }
}
