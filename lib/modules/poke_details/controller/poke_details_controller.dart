import 'package:flutter/material.dart';
import 'package:pokedex/modules/poke_details/model/pokemon_model.dart';
import 'package:pokedex/modules/poke_details/repository/pokemon_details_repository.dart';

class PokeDetailsController extends ValueNotifier<PokemonModel?> {
  PokeDetailsController(this.repository) : super(null);

  final IPokemonDetailsRepository repository;
  bool isLoading = false;

  Future<void> fetchPokemon(String url) async {
    isLoading = true;
    notifyListeners();

    final pokemon = await repository.fetchPokemon(url);
    value = pokemon;
    isLoading = false;
    notifyListeners();
  }
}
