import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Sedes Universidad de Los Lagos')),
        body: Column(
          children: [
            const card1(),
            const card3(),
            const card2(),
            ElevatedButton(
              onPressed: () {
                _launchURL('https://www.ulagos.cl');
              },
              child: Text('Más Informacion'),
            ),
          ],
        ),
      ),
    );
  }
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir $url';
    }
  }
}

class card1 extends StatelessWidget {
  const card1({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // Imagen
            Image.network(
              'https://tvcanal5.cl/wp-content/uploads/2020/11/universidad-de-los-lagos.jpg',
              width: double.infinity, 
              height: 100, 
              fit: BoxFit.cover, 
            ),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Sede Osorno',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class card2 extends StatelessWidget {
  const card2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // Imagen
            Image.network(
              'https://www.ulagos.cl/wp-content/uploads/2020/12/chiloe-scaled.jpg',              
              width: double.infinity,
              height: 100, 
              fit: BoxFit.cover, 
            ),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Sede Chiloe',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class card3 extends StatelessWidget {
  const card3({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // Imagen
            Image.network(
              'https://www.ulagos.cl/wp-content/uploads/2020/12/Chinquihue-scaled.jpg',
              width: double.infinity, 
              height: 100, 
              fit: BoxFit.cover, 
            ),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Sede Puerto Montt',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


