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
      body: Container(
        // Fondo de color #ebeffa
        color: Color(0xFFEBEFFA),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Logo
              Image.asset(
                'assets/logo_proyecto.png', // Reemplaza con la ruta de tu logo
                height: 100.0, // Ajusta la altura según sea necesario
              ),
              SizedBox(height: 20.0),

              // Texto debajo del logo
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Bienvenido a FinanSecure ¿Qué acción deseas realizar?',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'OpenSans-SemiBold', // Tipo de texto "Open Sans Semi-Bold"
                    color: Color(0xFF27348B), // Color #27348B
                  ),
                ),
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
                style: ElevatedButton.styleFrom(
                  // Color del botón Crear Cuenta #6378B9
                  primary: Color(0xFF6378B9),
                ),
                child: Text(
                  'Crear Cuenta',
                  style: TextStyle(
                    color: Colors.white, // Color del texto blanco
                  ),
                ),
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
                style: ElevatedButton.styleFrom(
                  // Color de las letras del botón Iniciar Sesión #F9B233
                  onPrimary: Color(0xFFF9B233),
                  // Color del botón Iniciar Sesión #27348B
                  primary: Color(0xFF27348B),
                ),
                child: Text('Iniciar Sesión'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
