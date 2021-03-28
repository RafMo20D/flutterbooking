import 'dart:async';

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import 'googleMap_message.dart';
import 'json_message.dart';


typedef JsonMessage OnError(
    {@required int status,
      @required String errorMessage});
typedef JsonMessage OnResponse({@required Map<String, dynamic> data});

abstract class WebApiClient {
  static final Dio _httpClient = Dio();

  OnResponse get onResponse;

  OnError get onError;

  Future<JsonMessage> post({
    @required String url,
    @required String token,
    Map<String, dynamic> data,
    Map<String, dynamic> queryParameters,
  }) async {
    try {
      final response = await _httpClient.post(
        url,
        queryParameters: queryParameters,
        data: data,
        options: Options(
          contentType: "application/json",
          headers: token == null
              ? {
            'x-hasura-admin-secret': 'WTU3BVBR6fEegVZcuDTMtwCXnBsWwHda'
          } //for test only
              : {'Authorization': 'Bearer $token'},
        ),
      );

      return onResponse(data: response.data);
    } on DioError catch (error) {
      return onError(
        status: error.response.statusCode,
        errorMessage: error.message,
      );
    } catch (error) {
      return onError(
        status: 500,
        errorMessage: error.toString(),
      );
    }
  }

  Future<JsonMessage> get({
    @required String url,
    @required String token,
    Map<String, dynamic> queryParameters,
  }) async {
    try {
      final response = await _httpClient.get(
        url,
        queryParameters: queryParameters,
        options: Options(
          contentType: "application/json",
          headers: token == null ? null : {'Authorization': 'Bearer $token'},
        ),
      );
      return onResponse(data: response.data);
    } on DioError catch (error) {
      return onError(
        status: error.response.statusCode,
        errorMessage: error.message,
      );
    } catch (error) {
      return onError(
        status: 500,
        errorMessage: error.toString(),
      );
    }
  }

  Future<JsonMessage> download({
    @required String url,
    @required String token,
    @required String filePath,
    Map<String, dynamic> queryParameters,
    Function(int received, int total, int percent) onReceiveProgress,
    Function onDownloaded,
  }) async {
    try {
      int lastPercent = 0;
      final response = await _httpClient.download(
        url,
        filePath,
        queryParameters: queryParameters,
        options: Options(
          contentType: "application/json",
          headers: token == null ? null : {'Authorization': 'Bearer $token'},
        ),
        onReceiveProgress: (received, total) {
          if (onReceiveProgress != null) {
            int percent = (100 * received / total).ceil();
            if (percent > lastPercent) {
              lastPercent = percent;
              onReceiveProgress(received, total, percent);
            }
          }
          if (onDownloaded != null && total > 0 && received == total)
            onDownloaded();
        },
      );
      return SuccessMessage();
      //return onResponse(data: response.data);
    } on DioError catch (error) {
      print("DioError: $error");
      return onError(
        status: error.response.statusCode,
        errorMessage: error.message,
      );
    } catch (error) {
      print("Error: $error");
      return onError(
        status: 500,
        errorMessage: error.toString(),
      );
    }
  }
}

class GMapClient extends WebApiClient {
  final OnResponse onResponse = ({@required Map<String, dynamic> data}) {
    return GMapMessage.fromJson(data);
  };

  final OnError onError = (
      {@required int status,
        @required String errorCode,
        @required String errorMessage}) {
    return GMapMessage(statusCode:  errorCode, errorMessage: errorMessage,);
  };

  Future<JsonMessage> fetch({
    @required String url,
    @required String key,
    Map<String, dynamic> queryParameters,
  }) async {
    return await get(
      url: url,
      token: null,
      queryParameters: queryParameters..["key"] = key,
    );
  }
}