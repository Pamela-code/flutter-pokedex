import 'package:dio/dio.dart';
import 'package:pokedex/modules/poke_details/model/pokemon_model.dart';
import 'package:pokedex/modules/poke_details/repository/pokemon_details_repository.dart';

class PokemonDetailsRepositoryImpl implements IPokemonDetailsRepository {
  final Dio dio;

  PokemonDetailsRepositoryImpl({Dio? dio}) : dio = dio ?? Dio();

  @override
  Future<PokemonModel> fetchPokemon(String url) async {
    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        return PokemonModel.fromJson(response.data);
      } else {
        throw Exception('Erro ao buscar Pokémon');
      }
    } catch (e) {
      throw Exception('Erro ao buscar Pokémon: $e');
    }
  }
}
