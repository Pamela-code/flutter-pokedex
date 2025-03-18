import 'package:dartz/dartz.dart';
import 'package:pokedex/core/constants.dart';
import 'package:pokedex/core/network/http_client.dart';
import 'package:pokedex/modules/home/model/poke_list_item_model.dart';
import 'package:pokedex/modules/home/repository/poke_list_repository.dart';

import '../../../core/failure.dart';

class PokeListRepositoryImpl implements IPokeListRepository {
  final IHttpClient client;
  final int pageSize = 20;

  PokeListRepositoryImpl(this.client);

  @override
  Future<Either<BaseFailure, List<PokeListItemModel>>> fetchPokeList({int offset = 0, int limit = 20}) async {
    try {
      final result = await client.get('$baseUrl?limit=$pageSize&offset=$offset');

      return result.fold((failure) => Left(failure), (response) {
        if (response.statusCode == 200) {
          List results = response.data['results'];
          return Right(results.map((e) => PokeListItemModel.fromJson(e)).toList());
        } else {
          return Left(FetchPokeListFailure(debugMessage: 'Unexpected status code: ${response.statusCode}'));
        }
      });
    } catch (e) {
      return Left(FetchPokeListFailure(debugMessage: e.toString()));
    }
  }
}
