import 'package:dartz/dartz.dart';
import 'package:pokedex/modules/poke_details/model/pokemon_model.dart';

import '../../../core/failure.dart';

abstract class IPokemonDetailsRepository {
  Future<Either<BaseFailure, PokemonModel>> fetchPokemon(String url);
}
