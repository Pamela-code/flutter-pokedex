import 'package:flutter/material.dart';
import 'package:pokedex/app/app_locator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokedex/modules/poke_details/model/pokemon_type_enum.dart';

import '../controller/poke_details_controller.dart';

class PokeDetailsView extends StatefulWidget {
  const PokeDetailsView({super.key, required this.url});

  final String url;

  @override
  State<PokeDetailsView> createState() => _PokeDetailsViewState();
}

class _PokeDetailsViewState extends State<PokeDetailsView> {
  final controller = locator<PokeDetailsController>();

  Color? typeColor(List<PokemonType> types) {
    switch (types[0]) {
      case PokemonType.bug:
        return Colors.yellow;
      case PokemonType.fire:
        return Colors.red;
      case PokemonType.water:
        return Colors.blue;
      case PokemonType.flying:
        return Colors.lightBlue;
      case PokemonType.grass:
        return Colors.green;
      case PokemonType.electric:
        return Colors.amber;
      case PokemonType.psychic:
        return Colors.pink;
      case PokemonType.ice:
        return Colors.cyan;
      case PokemonType.rock:
        return Colors.brown;
      case PokemonType.ghost:
        return Colors.deepPurple;
      case PokemonType.dragon:
        return Colors.indigo;
      case PokemonType.dark:
        return Colors.black87;
      case PokemonType.steel:
        return Colors.blueGrey;
      case PokemonType.fairy:
        return Colors.pinkAccent;
      default:
        return Colors.white;
    }
  }

  @override
  void initState() {
    super.initState();
    controller.fetchPokemon(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, pokemon, child) {
          if (controller.isLoading && pokemon == null) {
            return Center(child: CircularProgressIndicator());
          }
          if (controller.errorMessage != null && pokemon == null) {
            return Center(child: Text(controller.errorMessage!));
          }
          if (pokemon != null) {
            return Container(
              color: typeColor(pokemon.types),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CachedNetworkImage(
                      imageUrl: pokemon.imageUrl,
                      placeholder: (context, url) => const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                      width: 200,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 16),

                    Text(pokemon.name.toUpperCase(), style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),

                    Wrap(
                      spacing: 8,
                      children:
                          pokemon.types.map((type) {
                            return Chip(label: Text(type.name));
                          }).toList(),
                    ),
                    const SizedBox(height: 16),

                    Text("Altura: ${pokemon.height} cm", style: const TextStyle(fontSize: 16)),
                    Text("Peso: ${pokemon.weight} kg", style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
