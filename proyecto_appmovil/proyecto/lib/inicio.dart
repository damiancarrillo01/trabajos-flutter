import 'package:flutter/material.dart';
import 'principal.dart'; // Importa la página principal

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('¡Bienvenido!'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Mensaje de bienvenida con el nombre
            Text('Hola [nombre]'),

            // Campos para ingresos mensuales y fecha
            SizedBox(height: 20.0),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Ingresos Mensuales',
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                labelText: 'Fecha de Recepción de Ingresos',
              ),
            ),
            SizedBox(height: 20.0),

            // Botón para continuar
            ElevatedButton(
              onPressed: () {
                // Lógica para continuar
                // Aquí podrías realizar alguna acción adicional antes de navegar a la página principal

                // Navegar a la página principal
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => PagSaldo()),
                  (route) => false,
                );
              },
              child: Text('Continuar'),
            ),
          ],
        ),
      ),
    );
  }
}
