import 'package:flutter/material.dart';

class PagSaldo extends StatelessWidget {
  double saldoActual = 0.0;
  List<Movimiento> movimientos = [];
  TextEditingController montoController = TextEditingController();
  TextEditingController descripcionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FinanSecure'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Sección de Saldo Actual
            Text('Saldo Actual: \$${saldoActual.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 20.0),

            // Sección de Movimientos de Dinero
            Text('Movimientos de Dinero:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: movimientos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${movimientos[index].descripcion}'),
                    subtitle: Text('\$${movimientos[index].monto.toStringAsFixed(2)}'),
                  );
                },
              ),
            ),

            // Sección de Añadir Gasto Diario
            SizedBox(height: 20.0),
            Text('Añadir Gasto del Día:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            TextField(
              controller: montoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Monto'),
            ),
            TextField(
              controller: descripcionController,
              decoration: InputDecoration(labelText: 'Descripción'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                // Lógica para añadir gasto diario
                agregarMovimiento(
                  double.parse('0' + montoController.text),
                  descripcionController.text,
                );
              },
              child: Text('Añadir'),
            ),

            // Sección de Añadir Recibo del Día
            SizedBox(height: 20.0),
            Text('Añadir Recibo del Día:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Monto'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Descripción'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                // Lógica para añadir recibo diario
                agregarMovimiento(
                  double.parse('0' + montoController.text),
                  descripcionController.text,
                );
              },
              child: Text('Añadir'),
            ),

            // Sección de Gastos Mensuales
            SizedBox(height: 20.0),
            Text('Gastos Mensuales:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            ElevatedButton(
              onPressed: () {
                _mostrarDialogoAgregarGastoMensual(context);
              },
              child: Text('Añadir Gasto Mensual'),
            ),
          ],
        ),
      ),
    );
  }

  // Función para mostrar el diálogo de agregar gasto mensual
  Future<void> _mostrarDialogoAgregarGastoMensual(BuildContext context) async {
    double monto = 0.0;
    int periodoEnMeses = 1;
    String descripcion = '';

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Añadir Gasto Mensual'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    monto = double.tryParse(value) ?? 0.0;
                  },
                  decoration: InputDecoration(labelText: 'Monto'),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    periodoEnMeses = int.tryParse(value) ?? 1;
                  },
                  decoration: InputDecoration(labelText: 'Periodo en Meses'),
                ),
                TextField(
                  onChanged: (value) {
                    descripcion = value;
                  },
                  decoration: InputDecoration(labelText: 'Descripción'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Lógica para añadir gasto mensual
                agregarMovimiento(monto, descripcion);
                Navigator.of(context).pop();
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  // Función para agregar movimientos
  void agregarMovimiento(double monto, String descripcion) {
    // Descomenta la siguiente línea para actualizar el estado
    //setState(() {
      movimientos.add(Movimiento(monto: monto, descripcion: descripcion));
      saldoActual += monto;
    //});
  }
}

class Movimiento {
  double monto;
  String descripcion;

  Movimiento({required this.monto, required this.descripcion});
}
