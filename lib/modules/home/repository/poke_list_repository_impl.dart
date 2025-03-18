import 'package:dio/dio.dart';
import 'package:pokedex/modules/home/model/poke_list_item_model.dart';
import 'package:pokedex/modules/home/repository/poke_list_repository.dart';
import 'package:pokedex/core/constants.dart';

class PokeListRepositoryImpl implements IPokeListRepository {
  final Dio dio;
  final int pageSize = 20;

  PokeListRepositoryImpl({Dio? dio}) : dio = dio ?? Dio();

  @override
  Future<List<PokeListItemModel>> fetchPokeList({int offset = 0, int limit = 20}) async {
    try {
      final response = await dio.get('$baseUrl?limit=$pageSize&offset=$offset');

      if (response.statusCode == 200) {
        List results = response.data['results'];
        return results.map((e) => PokeListItemModel.fromJson(e)).toList();
      } else {
        throw Exception('Erro ao buscar Pokémon');
      }
    } catch (e) {
      throw Exception('Erro ao buscar Pokémon: $e');
    }
  }
}
