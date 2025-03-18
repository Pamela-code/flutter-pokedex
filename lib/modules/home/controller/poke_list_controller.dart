import 'package:flutter/material.dart';
import 'package:pokedex/modules/home/model/poke_list_item_model.dart';
import 'package:pokedex/modules/home/repository/poke_list_repository.dart';

class PokeListController extends ValueNotifier<List<PokeListItemModel>> {
  PokeListController(this.repository) : super([]);

  final IPokeListRepository repository;
  bool isLoading = false;
  int offset = 0;
  final int limit = 20;
  String? errorMessage;

  Future<void> fetchPokemons() async {
    if (isLoading) return;

    isLoading = true;
    errorMessage = null;
    notifyListeners();

    final result = await repository.fetchPokeList(offset: offset, limit: limit);

    result.fold(
      (failure) {
        errorMessage = failure.userMessage;
      },
      (newPokemons) {
        value = [...value, ...newPokemons];
        offset += limit;
      },
    );

    isLoading = false;
    notifyListeners();
  }
}
