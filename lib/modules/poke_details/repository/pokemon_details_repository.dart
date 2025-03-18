import 'package:pokedex/modules/poke_details/model/pokemon_model.dart';

abstract class IPokemonDetailsRepository {
  Future<PokemonModel> fetchPokemon(String url);
}
