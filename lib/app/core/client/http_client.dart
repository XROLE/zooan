import 'package:dio/dio.dart';

class HttpClient {
  final Dio dio = Dio();

  Future<dynamic> get(String route) async {
    Future<dynamic> get(String url) async {
      try {
        final response = await dio.get(url);
        return response;
      } catch (e) {
        print('Dio caught error ====================> $e');
      }
    }
  }
}
