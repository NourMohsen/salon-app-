import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:salon_app/config/resources/app_constants.dart';
import 'package:salon_app/core/services/injector_service.dart';
import '../../config/resources/app_end_points.dart';
import '../exceptions/exceptions.dart';
import 'api_consumer.dart';
import 'interceptors.dart';

class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({
    required this.client,
  }) {
    client.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..connectTimeout = const Duration(minutes: 1)
      ..headers = {
        contentType: applicationJson,
        accept: applicationJson,
      }
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < 500;
      };
    client.interceptors.add(AppInterceptors());
    if (kDebugMode) {
      client.interceptors.add(LogInterceptor());
    }
  }

  String applicationJson = 'application/json';
  String contentType = 'content-type';
  String accept = 'accept';
  String authorization = 'authorization';
  String defaultLanguage = 'language';

  @override
  Future post(
    String path, {
    Options? options,
    Map<String, dynamic>? queryParameters,
    Object? body,
  }) async {
    try {
      final response = await client.post(
        path,
        queryParameters: queryParameters,
        data: body,
        options: options ??
            Options(headers: {
              'Authorization':
                  'Bearer ${(prefsService.getData(AppConstants.token) != null) ? prefsService.getData(AppConstants.token)! : ''}',
            }),
      );
      return response;
    } on DioException catch (error) {
      _handleError(error);
    }
  }

  @override
  Future get(
    String path, {
    Options? options,
  }) async {
    try {
      final response = await client.get(
        path,
        options: options ??
            Options(headers: {
              'Authorization':
                  'Bearer ${(prefsService.getData(AppConstants.token) != null) ? prefsService.getData(AppConstants.token)! : ''}',
            }),
      );
      return response;
    } on DioException catch (error) {
      _handleError(error);
    }
  }

  DioExceptionType? _handleError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        throw const ServerException(
            message: 'Connection timed out while connecting to the server');
      case DioExceptionType.sendTimeout:
        throw const ServerException(
            message:
                'Connection timed out while sending request to the server');
      case DioExceptionType.receiveTimeout:
        throw const ServerException(
            message:
                'Connection timed out while receiving data from the server');
      case DioExceptionType.badCertificate:
        throw const ServerException(
            message: 'Invalid certificate from the server');
      case DioExceptionType.badResponse:
        if (dioError.response!.statusCode == 404) {
          throw const ServerException(
              message: 'Your request was not found, please try again later');
        } else if (dioError.response!.statusCode == 500) {
          throw const ServerException(
              message:
                  'There is a problem with the server, please try again later');
        } else if (dioError.response!.statusCode == 400 ||
            dioError.response!.statusCode == 401 ||
            dioError.response!.statusCode == 403) {
            throw const ServerException(message: 'An error occurred');
        } else {
          throw const ServerException(
              message: 'An error occurred, please try again');
        }
      case DioExceptionType.cancel:
        throw const ServerException(message: 'The request was canceled');
      case DioExceptionType.connectionError:
        throw const ServerException(message: 'No internet connection');
      case DioExceptionType.unknown:
        throw const ServerException(
            message: 'Sorry! An error occurred, please try again');
    }
  }
}
