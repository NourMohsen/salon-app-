import 'package:dio/dio.dart';

abstract class ApiConsumer {
  Future<dynamic> post(
      String path, {
        Map<String, dynamic>? queryParameters,
        Object body,
        Options? options,
      });

  Future<dynamic> get(
      String path, {
        Options? options,
      });
}
