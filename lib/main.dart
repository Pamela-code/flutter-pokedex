import 'package:flutter/material.dart';
import 'package:pokedex/app/app.dart';
import 'package:pokedex/app/app_locator.dart';

void main() {
  setupLocator();
  runApp(const App());
}
