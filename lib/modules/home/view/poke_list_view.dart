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
      appBar: AppBar(
        title: Text('Pokedex', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ValueListenableBuilder(
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
                return GestureDetector(
                  onTap: () => context.push('/details', extra: pokemons[index].url),
                  child: SizedBox(
                    height: 50,
                    child: Card(
                      color: const Color.fromARGB(255, 226, 91, 81),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25, top: 10),
                        child: Text(
                          pokemons[index].capitalizedName,
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
