import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_service;

class DioService {
  Dio dio = Dio();

  Future<dynamic> getMethod(String url) async {
    dio.options.headers['content-Type'] = 'application/Json';

    try {
      final response = await dio.get(
        url,
        options: Options(responseType: ResponseType.json, method: 'Get'),
      );
      log('GET response: ${response.data}');
      return response;
    } catch (e) {
      log('Error in getMethod: $e');
      throw Exception('Failed to perform GET request: $e');
    }
  }

  Future<dynamic> postMetod(Map<String, dynamic> map, String url) async {
    dio.options.headers['content-Type'] = 'application/Json';

    try {
      final response = await dio.post(
        url,
        data: dio_service.FormData.fromMap(map),
        options: Options(responseType: ResponseType.json, method: 'POST'),
      );

      log('Response headers: ${response.headers}');
      log('Response data: ${response.data}');
      log('Response status code: ${response.statusCode}');

      // بررسی و مدیریت داده‌های دریافتی
      final responseData = response.data;
      if (responseData is String) {
        final parsedNumber = num.tryParse(responseData) ?? 0;
        log('Parsed number from response: $parsedNumber');
      }

      return response;
    } catch (e) {
      log('Error in postMetod: $e');
      throw Exception('Failed to perform POST request: $e');
    }
  }
}
