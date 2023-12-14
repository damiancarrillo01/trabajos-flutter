import 'package:flutter/material.dart';
import 'inicio.dart'; // Importa la nueva página

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar Sesión'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Correo',
              ),
            ),
            SizedBox(height: 20.0),

            // Campo de entrada para la contraseña
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
              ),
            ),
            SizedBox(height: 20.0),

            // Botón para iniciar sesión
            ElevatedButton(
              onPressed: () {
                // Lógica para iniciar sesión
                // Aquí deberías verificar las credenciales, por ejemplo.

                // Luego, navega a la nueva página
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomePage()),
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
