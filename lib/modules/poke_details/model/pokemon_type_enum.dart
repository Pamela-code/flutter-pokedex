enum PokemonType {
  normal,
  fire,
  water,
  grass,
  electric,
  ice,
  fighting,
  poison,
  ground,
  flying,
  psychic,
  bug,
  rock,
  ghost,
  dragon,
  dark,
  steel,
  fairy;

  static PokemonType fromString(String type) =>
      PokemonType.values.firstWhere((e) => e.name == type, orElse: () => PokemonType.normal);
}
