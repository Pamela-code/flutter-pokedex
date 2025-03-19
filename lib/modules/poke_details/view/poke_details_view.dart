import 'package:flutter/material.dart';
import 'package:pokedex/app/app_locator.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../controller/poke_details_controller.dart';

class PokeDetailsView extends StatefulWidget {
  const PokeDetailsView({super.key, required this.url});

  final String url;

  @override
  State<PokeDetailsView> createState() => _PokeDetailsViewState();
}

class _PokeDetailsViewState extends State<PokeDetailsView> {
  final controller = locator<PokeDetailsController>();

  Color? typeColor(List<String> types) {
    switch (types[0]) {
      case "bug":
        return Colors.yellow;
      case "fire":
        return Colors.red;
      case "water":
        return Colors.blue;
      case "flying":
        return Colors.lightBlue;
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
                            return Chip(label: Text(type));
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
