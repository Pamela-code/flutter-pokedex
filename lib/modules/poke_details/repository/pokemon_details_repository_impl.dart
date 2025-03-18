import 'package:dartz/dartz.dart';
import 'package:pokedex/core/failure.dart';
import 'package:pokedex/core/network/http_client.dart';
import 'package:pokedex/modules/poke_details/model/pokemon_model.dart';
import 'package:pokedex/modules/poke_details/repository/pokemon_details_repository.dart';

class PokemonDetailsRepositoryImpl implements IPokemonDetailsRepository {
  final IHttpClient client;

  PokemonDetailsRepositoryImpl(this.client);

  @override
  Future<Either<BaseFailure, PokemonModel>> fetchPokemon(String url) async {
    try {
      final result = await client.get(url);

      return result.fold((failure) => Left(failure), (response) {
        if (response.statusCode == 200) {
          return Right(PokemonModel.fromJson(response.data));
        } else {
          return Left(FetchPokemonFailure(debugMessage: 'Unexpected status code: ${response.statusCode}'));
        }
      });
    } catch (e) {
      return Left(FetchPokemonFailure(debugMessage: e.toString()));
    }
  }
}
