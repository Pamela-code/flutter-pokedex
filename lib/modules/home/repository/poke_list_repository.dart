import '../model/poke_list_item_model.dart';

abstract class IPokeListRepository {
  Future<List<PokeListItemModel>> fetchPokeList({int offset = 0, int limit = 20});
}
