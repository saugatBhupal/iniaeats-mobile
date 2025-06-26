import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:inaeats/src/core/error/token_expire_handler.dart';
import 'package:inaeats/src/core/http/custom_exception.dart';

handleErrorResponse(DioException e) async {
  if (e.response?.statusCode == 401) {
    TokenExpireHandler().handleExpire();
  }

  if (e.toString().toLowerCase().contains("socketexception")) {
    throw NoInternetException('No Internet connection');
  } else {
    if (e.response != null) {
      debugPrint("Dio error response: ${e.response?.data}");
      return await _response(e.response!, e.response!.statusCode.toString());
    } else {
      throw FetchDataException('An error occurred while fetching data.');
    }
  }
}

Future<Map<String, dynamic>> _response(Response response, String url, {bool cacheResult = false}) async {
  final Map<String, dynamic> res = response.data is Map ? response.data : {};
  final responseJson = <String, dynamic>{};
  responseJson['data'] = res;

  responseJson['statusCode'] = response.statusCode;
  switch (response.statusCode) {
    case 200:
      if (cacheResult) {
        try {
          // await SharedPref.setRestApiData(url, json.encode(res));
        } catch (e) {
          debugPrint(e.toString());
        }
      }

      return responseJson;
    case 204:
      return responseJson;
    case 201:
      return responseJson;
    case 400:
      throw BadRequestException(getErrorMessage(res), response.statusCode);
    case 401:
    case 402:
      throw UnauthorizedException(getErrorMessage(res), response.statusCode);
    case 403:
      throw ForbiddenException(getErrorMessage(res), response.statusCode);
    case 404:
      throw ResourceNotFoundException(getErrorMessage(res), response.statusCode);
    case 409:
      throw ResourceNotFoundException(getErrorMessage(res), response.statusCode);
    case 422:
      responseJson['error'] = getErrorMessage(res);
      throw BadRequestException(getErrorMessage(res), response.statusCode);
    case 500:
      throw InternalServerErrorException(getErrorMessage(res), response.statusCode);
    default:
      throw NoInternetException('Error occured while Communication with Server', response.statusCode);
  }
}

String getErrorMessage(dynamic res) {
  try {
    debugPrint("-------------------GET ERROR ------------------ ");

    if (res is String) {
      res = jsonDecode(res);
    }

    if (res['detail'] is Map && res['detail']['message'] is String) {
      return res['detail']['message'];
    }
    if (res['message'] is String) {
      return res['message'];
    }
    if (res['message'] is List) {
      final List<dynamic> messages = res['message'][0]["messages"];
      return messages.map((e) => e['message']).join('\n');
    }
    if (res['error'] is Map && res['error']['message'] is String) {
      return res['error']['message'];
    }

    return "Something went wrong.";
  } catch (e) {
    debugPrint("Error extracting error message: $e");
    return "Unexpected error occurred.";
  }
}
