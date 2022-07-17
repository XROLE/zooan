import 'package:dio/dio.dart';
import 'package:zooan/app/core/client/http_client.dart';

class HttpClientImpl implements HttpClient {
  final Dio dio = Dio();
  HttpClientImpl(dio);

  @override
  Future<dynamic> get(String url) async {
    try {
      final response = await dio.get(url);
    return response;
    } catch (e) {
      print('Dio caught error ====================> $e');
    }
  }
}
