import 'package:equatable/equatable.dart';
import 'package:pokedex/modules/poke_details/model/pokemon_type_enum.dart';

class PokemonModel extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final List<PokemonType> types;
  final int height;
  final int weight;

  const PokemonModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.types,
    required this.height,
    required this.weight,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['sprites']['other']['official-artwork']['front_default'],
      types: (json['types'] as List).map((e) => PokemonType.fromString(e['type']['name'])).toList(),
      height: json['height'],
      weight: json['weight'],
    );
  }

  PokemonModel copyWith({int? id, String? name, String? imageUrl, List<PokemonType>? types, int? height, int? weight}) {
    return PokemonModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      types: types ?? this.types,
      height: height ?? this.height,
      weight: weight ?? this.weight,
    );
  }

  @override
  List<Object?> get props => [id, name, imageUrl, types, height, weight];
}
