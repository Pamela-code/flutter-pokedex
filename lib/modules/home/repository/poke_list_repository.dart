import 'package:dartz/dartz.dart';
import 'package:pokedex/core/failure.dart';

import '../model/poke_list_item_model.dart';

abstract class IPokeListRepository {
  Future<Either<BaseFailure, List<PokeListItemModel>>> fetchPokeList({int offset = 0, int limit = 20});
}
