import 'package:dartz/dartz.dart';
import 'package:pokedex/core/failure.dart';

abstract class IHttpClient {
  Future<Either<ClientFailure, dynamic>> get(String url);
}
