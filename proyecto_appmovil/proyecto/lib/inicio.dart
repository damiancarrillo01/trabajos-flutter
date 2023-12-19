import 'package:flutter/material.dart';
import 'principal.dart'; // Importa la página principal

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '¡Bienvenido!',
          style: TextStyle(
            fontFamily: 'OpenSans-SemiBold', // Tipo de texto 
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
            Image.asset(
              'assets/Logo_Proyecto2.png', 
              height: 100.0, // altura
            ),
            SizedBox(height: 20.0),

            
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Hola [nombre] para poder comenzar a interactuar necesitamos que ingreses un monto mensual',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans-Regular', // Tipo de texto 
                  color: Color(0xFF27348B), // Color #27348B
                ),
              ),
            ),
            // Campo para el nombre del ingreso
            SizedBox(height: 20.0),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Nombre del Ingreso',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF27348B), // Color #27348B
                  ),
                ),
                prefixIcon: Icon(
                  Icons.description,
                  color: Color(0xFF27348B), // Color #27348B
                ),
                labelStyle: TextStyle(
                  fontFamily: 'OpenSans-Regular', // Tipo de texto 
                  color: Color(0xFF27348B), // Color #27348B
                ),
              ),
            ),
            SizedBox(height: 10.0),

            // Campo para el monto que se recibe
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Monto que se Recibe',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF27348B), // Color #27348B
                  ),
                ),
                prefixIcon: Icon(
                  Icons.attach_money,
                  color: Color(0xFF27348B), // Color #27348B
                ),
                labelStyle: TextStyle(
                  fontFamily: 'OpenSans-Regular', // Tipo de texto 
                  color: Color(0xFF27348B), // Color #27348B
                ),
              ),
            ),
            SizedBox(height: 10.0),

            // Campo para el día de recibo de ingresos
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Día de Recibo de Ingresos',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF27348B), // Color #27348B
                  ),
                ),
                prefixIcon: Icon(
                  Icons.calendar_today,
                  color: Color(0xFF27348B), // Color #27348B
                ),
                labelStyle: TextStyle(
                  fontFamily: 'OpenSans-Regular', // Tipo de texto 
                  color: Color(0xFF27348B), // Color #27348B
                ),
              ),
            ),
            SizedBox(height: 10.0),

            // Campo desplegable para el período de recibo
            Container(
              width: double.infinity,
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Período de Recibo',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF27348B), // Color #27348B
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.date_range,
                    color: Color(0xFF27348B), // Color #27348B
                  ),
                  labelStyle: TextStyle(
                    fontFamily: 'OpenSans-Regular', // Tipo de texto 
                    color: Color(0xFF27348B), // Color #27348B
                  ),
                ),
                items: [
                  DropdownMenuItem(
                    child: Text('15 días'),
                    value: '15_dias',
                  ),
                  DropdownMenuItem(
                    child: Text('1 mes'),
                    value: '1_mes',
                  ),
                  DropdownMenuItem(
                    child: Text('2 meses'),
                    value: '2_meses',
                  ),
                  DropdownMenuItem(
                    child: Text('6 meses'),
                    value: '6_meses',
                  ),
                  DropdownMenuItem(
                    child: Text('1 año'),
                    value: '1_ano',
                  ),
                  DropdownMenuItem(
                    child: Text('Indefinido'),
                    value: 'indefinido',
                  ),
                ],
                onChanged: (String? value) {
                  // Manejar el cambio en el valor seleccionado
                },
              ),
            ),
            SizedBox(height: 20.0),

            // Botón para continuar
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Lógica para continuar
                  

                  // Navegar a la página principal
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => PagSaldo()),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  // Color del botón Continuar #9da3b9
                  primary: Color(0xFF9DA3B9),
                ),
                child: Text(
                  'Continuar',
                  style: TextStyle(
                    fontFamily: 'OpenSans-SemiBold', // Tipo de texto 
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
