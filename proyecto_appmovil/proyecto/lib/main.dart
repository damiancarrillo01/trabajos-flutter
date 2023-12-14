import 'package:flutter/material.dart';
import 'crear_cuenta.dart';
import 'inicio_sesion.dart';
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
        title: Text('Mi Aplicación'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Logo
            Image.asset(
              'assets/tu_logo.png', // Reemplaza con la ruta de tu logo
              height: 100.0, // Ajusta la altura según sea necesario
            ),
            SizedBox(height: 20.0),

            // Texto debajo del logo
            Text(
              '¿Qué acción deseas hacer?',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 30.0),

            // Botones
            ElevatedButton(
              onPressed: () {
                // Navegar a la página de crear cuenta
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateAccountPage()),
                );
              },
              child: Text('Crear Cuenta'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                // Navegar a la página de inicio de sesión
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Iniciar Sesión'),
            ),
          ],
        ),
      ),
    );
  }
}