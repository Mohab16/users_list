import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();
  static Dio? dio;

  static Dio getDio() {
    const timeout = Duration(seconds: 180);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeout
        ..options.receiveTimeout = timeout;

      _addAuthInterceptor();
      _addLogger();

      return dio!;
    } else {
      return dio!;
    }
  }

  // 👇 يضيف التوكن أوتوماتيك
  static void _addAuthInterceptor() {
    dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final apiKey = dotenv.env['API_KEY'] ?? '';

          options.headers['x-api-key'] = apiKey;

          handler.next(options);
        },

        // onError: (e, handler) {
        //   if (e.response?.statusCode == 401) {
        //     // هنا مش بنعمل navigation
        //     // بس بنمسح التوكن
        //     LocalStorage.clearAll();
        //   }
        //   handler.next(e);
        // },
      ),
    );
  }

  static void _addLogger() {
    dio!.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
      ),
    );
  }
}
