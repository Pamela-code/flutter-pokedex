import 'package:dio/dio.dart';
import 'http_client.dart';

class DioClientImpl implements IHttpClient {
  final Dio _dio = Dio();

  @override
  Future<dynamic> get(String url) async {
    try {
      final response = await _dio.get(url);
      return response.data;
    } catch (e) {
      throw Exception('Erro ao buscar dados: $e');
    }
  }
}
