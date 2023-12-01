import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PokemonCarousel extends StatelessWidget {
  final List<Map<String, dynamic>> pokemonData = [
    {'nombre': 'Bulbasaur', 'tipo': 'Planta', 'numero': '001', 'imagen': 'bulbasaur2.png'},
    {'nombre': 'Charmander', 'tipo': 'Fuego', 'numero': '004', 'imagen': 'charmander.png'},
    {'nombre': 'Squirtle', 'tipo': 'Agua', 'numero': '007', 'imagen': 'squirtle.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 560.0,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
      ),
      items: pokemonData.map((pokemon) {
        return PokemonCard(pokemon: pokemon);
      }).toList(),
    );
  }
}

class PokemonCard extends StatelessWidget {
  final Map<String, dynamic> pokemon;

  PokemonCard({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(30.0), // Ajusta según sea necesario
            child: Image.asset(
              'assets/${pokemon['imagen']}',
              width: 240,
              height: 240,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.0, left: 20.0), // Ajusta según sea necesario
            child: ListTile(
              title: Text(
                pokemon['nombre'],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Pokedex:#${pokemon['numero']}',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          TagWidget(
            type:pokemon['tipo'],
            ),
          ],
        ),
      );
  }
}

class TagWidget extends StatelessWidget {
  final String type;
  
  TagWidget({required this.type});
  
  @override
  Widget build(BuildContext context) {
    Color tagColor = _getColorForType(type);
    
    return Container(
      margin: EdgeInsets.only(top: 6.0, left: 20.0),
      padding: EdgeInsets.symmetric(
        vertical: 10.0, 
        horizontal: 60.0,
      ),
      decoration: BoxDecoration(
        color: tagColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        type,
        style: TextStyle(color: Colors.white,fontSize:20 ),
      ),
    );
  }

  Color _getColorForType(String type) {
  print(type);
  Map<String, Color> typeColors = {
    'Agua': type == 'Agua' ? Colors.blue : Colors.grey,
    'Planta': type == 'Planta' ? Colors.green : Colors.grey,
    'Fuego': type == 'Fuego' ? Colors.orange : Colors.grey,
  };

  return typeColors[type] ?? Colors.grey;
}
}