import 'package:flutter/material.dart';
import 'inicio.dart'; // Importa la nueva página

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Texto e icono de la flecha para volver atrás
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Función para volver atrás
          },
        ),
        title: Text(
          'Iniciar Sesión',
          style: TextStyle(
            fontFamily: 'OpenSans-SemiBold', // Tipo de texto "Open Sans Semi-Bold"
            color: Color(0xFF27348B), // Color #27348B
          ),
        ),
      ),
      body: Container(
        color: Color(0xFFEBEFFA), // Color de fondo #ebeffa
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Logo
                Image.asset(
                  'assets/logo_proyecto.png',
                  height: 100.0,
                ),
                SizedBox(height: 20.0),

                // Campo de entrada para el correo
                Container(
                  width: 300.0,
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Correo',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF27348B), // Color #27348B
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color(0xFF27348B), // Color #27348B
                      ),
                      labelStyle: TextStyle(
                        fontFamily: 'OpenSans-Regular', // Tipo de texto "Open Sans Regular"
                        color: Color(0xFF27348B), // Color #27348B
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),

                // Campo de entrada para la contraseña
                Container(
                  width: 300.0,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF27348B), // Color #27348B
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color(0xFF27348B), // Color #27348B
                      ),
                      labelStyle: TextStyle(
                        fontFamily: 'OpenSans-Regular', // Tipo de texto "Open Sans Regular"
                        color: Color(0xFF27348B), // Color #27348B
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),

                // Botón para iniciar sesión
                Container(
                  width: 300.0,
                  child: ElevatedButton(
                    onPressed: () {
                      // Lógica para iniciar sesión
                      // Aquí deberías verificar las credenciales, por ejemplo.

                      // Luego, navega a la nueva página
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WelcomePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      // Color del botón Iniciar Sesión #9da3b9
                      primary: Color(0xFF9DA3B9),
                    ),
                    child: Text(
                      'Iniciar Sesión',
                      style: TextStyle(
                        fontFamily: 'OpenSans-SemiBold', // Tipo de texto "Open Sans Semi-Bold"
                        color: Color(0xFF27348B), // Color #27348B
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
