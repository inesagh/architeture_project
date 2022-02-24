import 'package:architeture_project/data/network/failure.dart';

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.BAD_REQUEST:
        return Failure(ResponseCode.BAD_REQUEST, ResponseMessages.BAD_REQUEST);
      case DataSource.FORBIDDEN:
        return Failure(ResponseCode.FORBIDDEN, ResponseMessages.FORBIDDEN);
      case DataSource.UNAUTHORISED:
        return Failure(
            ResponseCode.UNAUTHORISED, ResponseMessages.UNAUTHORISED);
      case DataSource.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, ResponseMessages.NOT_FOUND);
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponseCode.INTERNAL_SERVER_ERROR,
            ResponseMessages.INTERNAL_SERVER_ERROR);
      case DataSource.CONNECT_TIMEOUT:
        return Failure(
            ResponseCode.CONNECT_TIMEOUT, ResponseMessages.CONNECT_TIMEOUT);
      case DataSource.CANCEL:
        return Failure(ResponseCode.CANCEL, ResponseMessages.CANCEL);
      case DataSource.RECEIVE_TIMEOUT:
        return Failure(
            ResponseCode.RECEIVE_TIMEOUT, ResponseMessages.RECEIVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return Failure(
            ResponseCode.SEND_TIMEOUT, ResponseMessages.SEND_TIMEOUT);
      case DataSource.CACHE_ERROR:
        return Failure(ResponseCode.CACHE_ERROR, ResponseMessages.CACHE_ERROR);
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION,
            ResponseMessages.NO_INTERNET_CONNECTION);
      default:
        return Failure(ResponseCode.UNKNOWN, ResponseMessages.UNKNOWN);
    }
  }
}

class ResponseCode {
  //API status codes
  static const int SUCCESS = 200;
  static const int NO_CONTENT = 201;
  static const int BAD_REQUEST = 400;
  static const int FORBIDDEN = 403;
  static const int UNAUTHORISED = 401;
  static const int NOT_FOUND = 404;
  static const int INTERNAL_SERVER_ERROR = 500;

  //local status code
  static const int UNKNOWN = -1;
  static const int CONNECT_TIMEOUT = -2;
  static const int CANCEL = -3;
  static const int RECEIVE_TIMEOUT = -4;
  static const int SEND_TIMEOUT = -5;
  static const int CACHE_ERROR = -6;
  static const int NO_INTERNET_CONNECTION = -7;
}

class ResponseMessages {
  //API status codes
  static const String SUCCESS = "Success.";
  static const String NO_CONTENT = "Success with no content.";
  static const String BAD_REQUEST = "Bad request, try again later.";
  static const String FORBIDDEN = "Forbidden request, try again later.";
  static const String UNAUTHORISED = "User is unauthorised, try again later.";
  static const String NOT_FOUND = "Url is not found, try again later.";
  static const String INTERNAL_SERVER_ERROR =
      "Something went wrong, try again later.";

  //local status code
  static const String UNKNOWN = "Something went wrong, try again later.";
  static const String CONNECT_TIMEOUT = "Time out error, try again later.";
  static const String CANCEL = "Request was cancelled, try again later.";
  static const String RECEIVE_TIMEOUT = "Time out error, try again later.";
  static const String SEND_TIMEOUT = "Time out error, try again later.";
  static const String CACHE_ERROR = "Cache error, try again later.";
  static const String NO_INTERNET_CONNECTION =
      "Please, check your internet connection";
}
