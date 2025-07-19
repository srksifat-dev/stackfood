// import 'package:dio/dio.dart';
// import 'package:stackfood/src/core/utils/utils.dart';

// class ApiClient {
//   final Dio _dio;

//   ApiClient(this._dio) {
//     _dio.options = BaseOptions(
//       baseUrl: 'https://stackfood-admin.6amtech.com/api/v1',
//       connectTimeout: const Duration(milliseconds: 30000),
//       receiveTimeout: const Duration(milliseconds: 30000),
//       headers: {
//         'Content-Type': 'application/json; charset=UTF-8',
//         'zoneId': '[1]',
//         'latitude': '23.735129',
//         'longitude': '90.425614',
//       },
//     );
//   }

//   Future<Response> get(
//     String path, {
//     Map<String, dynamic>? queryParameters,
//     Map<String, String>? headers,
//   }) async {
//     try {
//       Log.info('Request URL: ${_dio.options.baseUrl + path}');
//       Log.info('Query Parameters: $queryParameters');

//       final response = await _dio.get(
//         path,
//         queryParameters: queryParameters,
//         options: Options(headers: headers),
//       );

//       Log.info('Response: ${response.data}');
//       return response;
//     } on DioException catch (dioError) {
//       final errorMessage = _handleDioError(dioError);
//       Log.error('DioException: $errorMessage');
//       throw DioClientException(
//         message: errorMessage,
//         statusCode: dioError.response?.statusCode,
//       );
//     } catch (e) {
//       Log.error('Unexpected error: $e');
//       throw DioClientException(message: 'Unexpected error: $e');
//     }
//   }

//   String _handleDioError(DioException error) {
//     switch (error.type) {
//       case DioExceptionType.connectionTimeout:
//         return 'Connection timeout';
//       case DioExceptionType.sendTimeout:
//         return 'Send timeout';
//       case DioExceptionType.receiveTimeout:
//         return 'Receive timeout';
//       case DioExceptionType.badResponse:
//         return 'Server error: ${error.response?.statusCode} ${error.response?.statusMessage}';
//       case DioExceptionType.cancel:
//         return 'Request cancelled';
//       case DioExceptionType.unknown:
//         return 'No internet!: ${error.message}';
//       default:
//         return 'No internet or server error';
//     }
//   }
// }

// class DioClientException implements Exception {
//   final String message;
//   final int? statusCode;

//   DioClientException({required this.message, this.statusCode});

//   @override
//   String toString() => message;
// }

// api_client.dart
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:stackfood/src/core/api/api_client.dart';
import 'package:stackfood/src/core/services/cache_service.dart';
import 'package:stackfood/src/core/utils/utils.dart';

enum APIType { public, private }

class ApiResponse<T> {
  ApiResponse.success(this.data) : error = null;
  ApiResponse.failure(this.error) : data = null;
  final T? data;
  final DioException? error;

  bool get isSuccess => error == null;
}

class ApiClient {
  ApiClient._internal();

  static final ApiClient _instance = ApiClient._internal();
  static ApiClient get instance => _instance;

  late final Dio _dio;
  late final String baseUrl;
  late final CacheService _cacheService;

  void init({
    required String baseUrl,
    required CacheService cacheService,
    int connectionTimeout = 30000,
    int receiveTimeout = 30000,
    String? refreshTokenUrl,
    String Function(Map<String, dynamic>)? onTokenRefresh,
  }) {
    this.baseUrl = baseUrl;
    _cacheService = cacheService;

    final options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(milliseconds: connectionTimeout),
      receiveTimeout: Duration(milliseconds: receiveTimeout),
    );

    _dio = Dio(options)
      ..interceptors.addAll([
        PrettyDioLogger(requestHeader: true, requestBody: true),
        // DynamicInterceptor(
        //   baseUrl: baseUrl,
        //   cacheService: cacheService,
        //   refreshTokenUrl: refreshTokenUrl,
        //   onTokenRefresh: onTokenRefresh,
        // ),
      ]);
  }

  /// GET
  Future<ApiResponse<dynamic>> get({
    required APIType apiType,
    required String path,
    TokenType? tokenType,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    try {
      final options = await _getOptions(
        apiType: apiType,
        extraHeaders: headers,
        tokenType: tokenType,
      );
      final response = await _dio.get(
        path,
        queryParameters: query,
        options: options,
        cancelToken: cancelToken,
      );
      return ApiResponse.success(response.data);
    } on DioException catch (e) {
      return _handleDioException(e);
    }
  }

  /// POST
  Future<ApiResponse<dynamic>> post({
    required APIType apiType,
    required String path,
    TokenType? tokenType,
    dynamic data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    try {
      final options = await _getOptions(
        apiType: apiType,
        extraHeaders: headers,
        tokenType: tokenType,
      );
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: query,
        options: options,
        cancelToken: cancelToken,
      );
      return ApiResponse.success(response.data);
    } on DioException catch (e) {
      return _handleDioException(e);
    }
  }

  /// PUT
  Future<ApiResponse<dynamic>> put({
    required APIType apiType,
    required String path,
    TokenType? tokenType,
    dynamic data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    try {
      final options = await _getOptions(
        apiType: apiType,
        extraHeaders: headers,
        tokenType: tokenType,
      );
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: query,
        options: options,
        cancelToken: cancelToken,
      );
      return ApiResponse.success(response.data);
    } on DioException catch (e) {
      return _handleDioException(e);
    }
  }

  /// PATCH
  Future<ApiResponse<dynamic>> patch({
    required APIType apiType,
    required String path,
    TokenType? tokenType,
    dynamic data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    try {
      final options = await _getOptions(
        apiType: apiType,
        extraHeaders: headers,
        tokenType: tokenType,
      );
      final response = await _dio.patch(
        path,
        data: data,
        queryParameters: query,
        options: options,
        cancelToken: cancelToken,
      );
      return ApiResponse.success(response.data);
    } on DioException catch (e) {
      return _handleDioException(e);
    }
  }

  /// PATCH with FormData
  Future<ApiResponse<dynamic>> patchFormData({
    required APIType apiType,
    required String path,
    required Map<String, dynamic> data,
    File? applicationFile,
    TokenType? tokenType,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    try {
      final options = await _getOptions(
        apiType: apiType,
        extraHeaders: headers,
        tokenType: tokenType,
      );

      final formData = FormData();
      formData.fields.add(MapEntry('data', jsonEncode(data)));

      if (applicationFile != null) {
        final mimeType =
            lookupMimeType(applicationFile.path) ?? 'application/octet-stream';
        final contentType = MediaType.parse(mimeType);

        formData.files.add(
          MapEntry(
            'applicationFile',
            await MultipartFile.fromFile(
              applicationFile.path,
              filename: applicationFile.path.split('/').last,
              contentType: contentType,
            ),
          ),
        );
      }

      final response = await _dio.patch(
        path,
        data: formData,
        queryParameters: query,
        options: options,
        cancelToken: cancelToken,
      );
      return ApiResponse.success(response.data);
    } on DioException catch (e) {
      return _handleDioException(e);
    }
  }

  /// DELETE
  Future<ApiResponse<dynamic>> delete({
    required APIType apiType,
    required String path,
    TokenType? tokenType,
    dynamic data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    try {
      final options = await _getOptions(
        apiType: apiType,
        extraHeaders: headers,
        tokenType: tokenType,
      );
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: query,
        options: options,
        cancelToken: cancelToken,
      );
      return ApiResponse.success(response.data);
    } on DioException catch (e) {
      return _handleDioException(e);
    }
  }

  /// POST with FormData
  Future<ApiResponse<dynamic>> postFormData({
    required APIType apiType,
    required String path,
    required Map<String, dynamic> data,
    File? image,
    TokenType? tokenType,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    try {
      final options = await _getOptions(
        apiType: apiType,
        extraHeaders: headers,
        tokenType: tokenType,
      );

      final formData = FormData();
      formData.fields.add(MapEntry('data', jsonEncode(data)));

      if (image != null) {
        final mimeType =
            lookupMimeType(image.path) ?? 'application/octet-stream';
        final contentType = MediaType.parse(mimeType);

        formData.files.add(
          MapEntry(
            'images',
            await MultipartFile.fromFile(
              image.path,
              filename: image.path.split('/').last,
              contentType: contentType,
            ),
          ),
        );
      }

      final response = await _dio.post(
        path,
        data: formData,
        queryParameters: query,
        options: options,
        cancelToken: cancelToken,
      );
      return ApiResponse.success(response.data);
    } on DioException catch (e) {
      return _handleDioException(e);
    }
  }

  /// S3 file upload
  Future<ApiResponse<dynamic>> fileUploadInS3Bucket({
    required String preAssignedUrl,
    required File file,
  }) async {
    try {
      final response = await _dio.put(
        preAssignedUrl,
        data: file.openRead(),
        options: Options(
          headers: {Headers.contentLengthHeader: await file.length()},
        ),
      );
      return ApiResponse.success(response.data);
    } on DioException catch (e) {
      return _handleDioException(e);
    }
  }

  Future<Options> _getOptions({
    required APIType apiType,
    TokenType? tokenType,
    Map<String, dynamic>? extraHeaders,
    bool isBearer = true,
  }) async {
    final baseOptions = switch (apiType) {
      APIType.public => PublicApiOptions().options,
      APIType.private => PublicApiOptions().options,
      // await ProtectedApiOptions(
      //   cacheService: _cacheService,
      //   tokenType: tokenType,
      // ).options,
    };

    if (extraHeaders != null) {
      baseOptions.headers?.addAll(extraHeaders);
    }

    return baseOptions;
  }

  ApiResponse<T> _handleDioException<T>(DioException e) {
    Log.error('DioExceptionType → ${e.type}');
    Log.error('Error response → ${e.response?.data}');
    final backendMessage =
        e.response?.data['message'] ?? 'Something went wrong';

    return ApiResponse.failure(
      DioException(
        requestOptions: e.requestOptions,
        response: e.response,
        type: e.type,
        error: backendMessage,
      ),
    );
  }
}
