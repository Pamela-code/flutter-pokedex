import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/app/app_locator.dart';

import '../controller/poke_list_controller.dart';

class PokeListView extends StatefulWidget {
  const PokeListView({super.key});

  @override
  State<PokeListView> createState() => _PokeListViewState();
}

class _PokeListViewState extends State<PokeListView> {
  final controller = locator<PokeListController>();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.fetchPokemons();

    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent * 0.9) {
        controller.fetchPokemons();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pokedex')),
      body: ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, pokemons, child) {
          if (controller.isLoading && pokemons.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }

          if (controller.errorMessage != null) {
            Center(child: Text(controller.errorMessage!));
          }

          return ListView.builder(
            controller: scrollController,
            itemCount: pokemons.length + 1,
            itemBuilder: (context, index) {
              if (index == pokemons.length) {
                return controller.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : const SizedBox.shrink();
              }
              return ListTile(
                title: Text(pokemons[index].name),
                onTap: () => context.push('/details', extra: pokemons[index].url),
              );
            },
          );
        },
      ),
    );
  }
}
