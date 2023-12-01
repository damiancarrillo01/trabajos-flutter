import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PokemonCarousel extends StatelessWidget {
  final List<Map<String, dynamic>> pokemonData = [
    {'nombre': 'Bulbasaur', 'tipo': 'Planta', 'numero': '001', 'imagen': 'bulbasaur2.jpg'},
    {'nombre': 'Charmander', 'tipo': 'Fuego', 'numero': '004', 'imagen': 'charmander.jpg'},
    {'nombre': 'Squirtle', 'tipo': 'Agua', 'numero': '007', 'imagen': 'squirtle.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 370.0,
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
          Image.asset('${pokemon['imagen']}',
          width: 200, 
            height: 200,
            fit: BoxFit.cover,),
          ListTile(
            title: Text(pokemon['nombre']),
            subtitle: Text('#${pokemon['numero']}'),
          ),
          TagWidget(type: pokemon['tipo']),
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
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: tagColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        type,
        style: TextStyle(color: Colors.white),
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