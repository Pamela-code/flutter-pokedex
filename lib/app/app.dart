import 'package:flutter/material.dart';
import 'package:pokedex/app/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Pokedex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.red)),
      routerConfig: appRouter,
    );
  }
}
