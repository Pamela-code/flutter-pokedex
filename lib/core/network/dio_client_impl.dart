import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pokedex/core/failure.dart';
import 'http_client.dart';

class DioClientImpl implements IHttpClient {
  final Dio _dio = Dio();

  @override
  Future<Either<ClientFailure, dynamic>> get(String url) async {
    try {
      final response = await _dio.get(url);
      return Right(response);
    } catch (e) {
      return Left(ClientFailure(debugMessage: e.toString()));
    }
  }
}
