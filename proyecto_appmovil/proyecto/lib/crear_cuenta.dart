import 'package:flutter/material.dart';

class CreateAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Cuenta'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Campo de entrada para el nombre
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Nombre',
              ),
            ),
            SizedBox(height: 10.0),

            // Campo de entrada para el apellido
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Apellido',
              ),
            ),
            SizedBox(height: 10.0),

            // Campo de entrada para el correo
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Correo',
              ),
            ),
            SizedBox(height: 10.0),

            // Campo de entrada para la contraseña
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
              ),
            ),
            SizedBox(height: 10.0),

            // Campo de entrada para confirmar contraseña
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirmar Contraseña',
              ),
            ),
            SizedBox(height: 20.0),

            // Botón para crear cuenta
            ElevatedButton(
              onPressed: () {
                // Lógica para crear cuenta
              },
              child: Text('Crear Cuenta'),
            ),
          ],
        ),
      ),
    );
  }
}
