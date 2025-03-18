import 'package:get_it/get_it.dart';
import 'package:pokedex/modules/home/controller/poke_list_controller.dart';
import 'package:pokedex/modules/home/repository/poke_list_repository_impl.dart';
import 'package:pokedex/modules/poke_details/repository/pokemon_details_repository.dart';
import 'package:pokedex/modules/poke_details/repository/pokemon_details_repository_impl.dart';

import '../modules/home/repository/poke_list_repository.dart';
import '../modules/poke_details/controller/poke_details_controller.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<IPokeListRepository>(() => PokeListRepositoryImpl());
  locator.registerLazySingleton<IPokemonDetailsRepository>(() => PokemonDetailsRepositoryImpl());

  locator.registerLazySingleton<PokeListController>(() => PokeListController(locator()));
  locator.registerLazySingleton<PokeDetailsController>(() => PokeDetailsController(locator()));
}
