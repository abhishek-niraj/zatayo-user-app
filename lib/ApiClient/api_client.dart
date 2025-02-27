import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http_parser/http_parser.dart';
import 'package:zatayo/utils/app_shared_preference_helper.dart';

 // const baseUrl = 'https://srv430249.hstgr.cloud/backend/api/v1';
 const baseUrl = 'http://192.168.29.155:9000';
class ApiClient {
  final Dio _dio;

  ApiClient()
      : _dio = Dio(BaseOptions(
          baseUrl: '$baseUrl/api/v1',
              // Replace with your base URL
        ));

  Future<String?> loadData() async {
    AppSharedPreferenceHelper appSharedPreferenceHelper =
        AppSharedPreferenceHelper();
    return appSharedPreferenceHelper.getCustomerData('shutCustomerToken');
  }

  Future<Response> sendOtp(String phoneNumber) async {
    try {
      final response = await _dio.post('/customer/send-otp', data: {
        'phoneNumber': phoneNumber,
      });
      return response;
    } catch (e) {
      throw Exception('Failed to send OTP: $e');
    }
  }

  // New method for making API calls with Bearer token
  Future<Response> apiCall(
      {String? apiEndPoint, Map<String, dynamic>? data}) async {
    String? bearerToken = await loadData();

    if (kDebugMode) {
      print(apiEndPoint);
      print(data);
    }
    try {
      _dio.options.headers['Authorization'] = 'Bearer $bearerToken';

      final response = await _dio.post(
        apiEndPoint ?? '',
        data: data ?? {}, // Use empty map if data is null
      );
      return response;
    } catch (e) {
      if(!kReleaseMode){
        if (kDebugMode) {
          print(e);
        }
      }
      throw Exception('Failed to make API call: $e');
    }
  }



  // New method for making API calls with Bearer token
  Future<Response> apiCallGet(
      {String? apiEndPoint, Map<String, dynamic>? data}) async {
    String? bearerToken = await loadData();
    try {
      _dio.options.headers['Authorization'] = 'Bearer $bearerToken';

      final response = await _dio.get(
        apiEndPoint ?? '', // Use empty map if data is null
      );
      return response;
    } catch (e) {
      if(!kReleaseMode){
        if (kDebugMode) {
          print(e);
        }
      }
      throw Exception('Failed to make API call: $e');
    }
  }

  Future<Response> formData(
    String endPoint,
    Map<String, dynamic> body,
    Uint8List image,
  ) async {
    String? bearerToken = await loadData();
    final url =
        endPoint; // Use the endpoint directly (since baseUrl is already set in Dio)

    // Set Authorization header
    _dio.options.headers['Authorization'] = 'Bearer $bearerToken';

    // Create FormData object for multipart request
    FormData formData = FormData.fromMap({
      ...body, // Add form fields
      'profileImage': MultipartFile.fromBytes(
        image,
        filename: 'image.jpg',
        contentType:
            MediaType('image', 'jpg'), // Optional: specify the content type
      ),
    });

    try {
      // Send the request using Dio
      final response = await _dio.post(
        url,
        data: formData,
        options:
            Options(contentType: 'multipart/form-data'), // Set content type
      );
      if (kDebugMode) {
        print("Resposne");
      }
      if (kDebugMode) {
        print(response);
      }
      print("Response");
      return response;
    } catch (error) {
      // Handle errors
      if (kDebugMode) {
        print("Error: $error");
      }
      rethrow;
    }
  }
}
