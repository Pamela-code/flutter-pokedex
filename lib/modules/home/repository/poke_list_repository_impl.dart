import 'package:pokedex/core/constants.dart';
import 'package:pokedex/core/network/http_client.dart';
import 'package:pokedex/modules/home/model/poke_list_item_model.dart';
import 'package:pokedex/modules/home/repository/poke_list_repository.dart';

class PokeListRepositoryImpl implements IPokeListRepository {
  final IHttpClient client;
  final int pageSize = 20;

  PokeListRepositoryImpl(this.client);

  @override
  Future<List<PokeListItemModel>> fetchPokeList({int offset = 0, int limit = 20}) async {
    try {
      final response = await client.get('$baseUrl?limit=$pageSize&offset=$offset');

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
