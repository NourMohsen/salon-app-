import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../core/localization/locale_keys.g.dart';

abstract class Failure{
  final String errorMessage;
  Failure(this.errorMessage);
}

class ServerFailure extends Failure{
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioException(DioException dioException){
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(LocaleKeys.connectionTimeout.tr());
      case DioExceptionType.sendTimeout:
        return ServerFailure(LocaleKeys.sendTimeout.tr());
      case DioExceptionType.receiveTimeout:
        return ServerFailure(LocaleKeys.receiveTimeout.tr());
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioException.response);
      case DioExceptionType.cancel:
        return ServerFailure(LocaleKeys.requestCancelled.tr());
      case DioExceptionType.connectionError:
        return ServerFailure(LocaleKeys.connectionError.tr());
      case DioExceptionType.unknown:
        return ServerFailure(LocaleKeys.unexpectedError.tr());
      default:
        return ServerFailure(LocaleKeys.unexpectedError.tr());
    }
  }

  factory ServerFailure.fromResponse(Response? response) {
    if (response == null) {
      return ServerFailure(LocaleKeys.unexpectedServerError.tr());
    }
    switch (response.statusCode) {
      case 400:
      case 422:
        return ServerFailure(response.data["message"]);
      case 401:
        return ServerFailure(LocaleKeys.unauthorizedAccess.tr());
      case 403:
        return ServerFailure(LocaleKeys.forbidden.tr());
      case 404:
        return ServerFailure(LocaleKeys.notFound.tr());
      case 500:
        return ServerFailure(LocaleKeys.internalServerError.tr());
      case 503:
        return ServerFailure(LocaleKeys.serviceUnavailable.tr());
      default:
        return ServerFailure("${LocaleKeys.unexpectedStatusCode.tr()}: ${response.statusCode}.");
    }
  }

}

