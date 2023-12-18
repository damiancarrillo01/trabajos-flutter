import 'package:flutter/material.dart';

class CreateAccountPage extends StatelessWidget {
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
          'Crear Cuenta',
          style: TextStyle(
            fontFamily: 'OpenSans-SemiBold', // Tipo de texto "Open Sans Semi-Bold"
            color: Color(0xFF27348B), // Color #27348B
          ),
        ),
      ),
      body: Container(
        color: Color(0xFFEBEFFA), // Color de fondo #ebeffa
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Logo
            Image.asset(
              'assets/logo_proyecto.png',
              height: 100.0,
            ),
            SizedBox(height: 20.0),

            // Campo de entrada para el nombre y apellido
            Row(
              children: [
                Expanded(
                  child: Container(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Nombre',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF27348B), // Color #27348B
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color(0xFF27348B), // Color #27348B
                        ),
                        labelStyle: TextStyle(
                          fontFamily: 'OpenSans-Regular', // Tipo de texto "Open Sans Regular"
                          color: Color(0xFF27348B), // Color #27348B
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: Container(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Apellido',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF27348B), // Color #27348B
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color(0xFF27348B), // Color #27348B
                        ),
                        labelStyle: TextStyle(
                          fontFamily: 'OpenSans-Regular', // Tipo de texto "Open Sans Regular"
                          color: Color(0xFF27348B), // Color #27348B
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),

            // Campo de entrada para el correo
            Container(
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
            SizedBox(height: 10.0),

            // Campo de entrada para la contraseña
            Container(
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
            SizedBox(height: 10.0),

            // Campo de entrada para confirmar contraseña
            Container(
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirmar Contraseña',
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

            // Botón para crear cuenta
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Lógica para crear cuenta
                },
                style: ElevatedButton.styleFrom(
                  // Color del botón Crear Cuenta #9da3b9
                  primary: Color(0xFF9DA3B9),
                ),
                child: Text(
                  'Crear Cuenta',
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
    );
  }
}
