import 'package:flutter/material.dart';
import 'widgets/pokemon_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokémon Carousel'),
      ),
      body: Center(
        child: PokemonCarousel(),
      ),
    );
  }
}

