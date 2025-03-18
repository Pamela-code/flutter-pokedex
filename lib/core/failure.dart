abstract class BaseFailure {
  final String debugMessage;
  final String userMessage;

  BaseFailure({required this.debugMessage, required this.userMessage});

  @override
  String toString() => debugMessage;
}

class FetchPokeListFailure extends BaseFailure {
  FetchPokeListFailure({String? debugMessage})
    : super(
        debugMessage: debugMessage ?? 'Failed to fetch Pokémon list',
        userMessage: 'Ocorreu um erro ao buscar a lista de Pokémon. Tente novamente mais tarde.',
      );
}

class FetchPokemonFailure extends BaseFailure {
  FetchPokemonFailure({String? debugMessage})
    : super(
        debugMessage: debugMessage ?? 'Failed to fetch Pokémon list',
        userMessage: 'Ocorreu um erro ao buscar o Pokémon. Tente novamente mais tarde.',
      );
}

class ClientFailure extends BaseFailure {
  ClientFailure({String? debugMessage})
    : super(
        debugMessage: debugMessage ?? 'HTTP request failed',
        userMessage: 'Não foi possível buscar os dados. Verifique sua conexão e tente novamente.',
      );
}
