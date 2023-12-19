import 'package:flutter/material.dart';
import 'PaginaUsuario.dart';

class AhorrosProgramados extends StatefulWidget {
  @override
  _AhorrosProgramadosState createState() => _AhorrosProgramadosState();
}

class _AhorrosProgramadosState extends State<AhorrosProgramados> {
  TextEditingController nombreController = TextEditingController();
  TextEditingController montoTotalController = TextEditingController();
  TextEditingController diaController = TextEditingController();
  TextEditingController periodoController = TextEditingController();

  List<AhorroProgramado> ahorros = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEBEFFA),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/Logo_Proyecto1.png',
              height: 40.0,
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                // Navegar a la página de usuario
                Navigator.push(context, MaterialPageRoute(builder: (context) => PaginaUsuario()));
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: Color(0xFFEBEFFA), // Color de fondo #ebeffa
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              
              Text(
                'Ahorros Programados:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: 'OpenSans-Regular', color: Color(0xFF27348B)),
              ),
              SizedBox(height: 10.0),
              // Tabla de Ahorros Programados
              LimitedBox(
                maxHeight: 150.0,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: [
                        DataColumn(label: _styledText('Nombre')),
                        DataColumn(label: _styledText('Monto a Descontar')),
                        DataColumn(label: _styledText('Día')),
                        DataColumn(label: _styledText('Periodo (meses)')),
                        DataColumn(label: _styledText('Total Ahorro')),
                      ],
                      rows: ahorros.map((ahorro) {
                        return DataRow(cells: [
                          DataCell(_styledText(ahorro.nombre)),
                          DataCell(_styledText('\$${ahorro.montoMensual.toStringAsFixed(2)}')),
                          DataCell(_styledText(ahorro.dia.toString())),
                          DataCell(_styledText(ahorro.periodo.toString())),
                          DataCell(_styledText('\$${ahorro.montoTotal.toStringAsFixed(2)}')),
                        ]);
                      }).toList(),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.0),

              // Formulario para añadir Ahorro Programado
              Text(
                'Añadir Ahorro Programado:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: 'OpenSans-Regular', color: Color(0xFF27348B)),
              ),
              SizedBox(height: 10.0),
              _buildTextFieldWithIcon(
                controller: nombreController,
                labelText: 'Nombre',
                icon: Icons.description,
              ),
              _buildTextFieldWithIcon(
                controller: montoTotalController,
                labelText: 'Monto Total',
                icon: Icons.attach_money,
                keyboardType: TextInputType.number,
              ),
              _buildTextFieldWithIcon(
                controller: diaController,
                labelText: 'Día',
                icon: Icons.calendar_today,
                keyboardType: TextInputType.number,
              ),
              _buildTextFieldWithIcon(
                controller: periodoController,
                labelText: 'Periodo (meses)',
                icon: Icons.event,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  _agregarAhorroProgramado();
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF27348B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  'Añadir',
                  style: TextStyle(fontFamily: 'OpenSans-Regular', color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text _styledText(String label) {
    return Text(
      label,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Widget _buildTextFieldWithIcon({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      width: 300.0,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: TextStyle(fontFamily: 'OpenSans-Regular', color: Color(0xFF27348B)),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          border: OutlineInputBorder(),
          prefixIcon: Icon(icon, color: Color(0xFF27348B)),
        ),
      ),
    );
  }

  void _agregarAhorroProgramado() {
    String nombre = nombreController.text;
    double montoTotal = double.tryParse(montoTotalController.text) ?? 0.0;
    int dia = int.tryParse(diaController.text) ?? 1;
    int periodo = int.tryParse(periodoController.text) ?? 1;

    if (nombre.isNotEmpty && montoTotal > 0 && periodo > 0) {
      double montoMensual = montoTotal / periodo;
      setState(() {
        ahorros.add(AhorroProgramado(
          nombre: nombre,
          montoTotal: montoTotal,
          dia: dia,
          periodo: periodo,
          montoMensual: montoMensual,
        ));
      });
      // Limpiar los controladores después de añadir
      nombreController.clear();
      montoTotalController.clear();
      diaController.clear();
      periodoController.clear();
    }
  }
}

class AhorroProgramado {
  String nombre;
  double montoTotal;
  int dia;
  int periodo;
  double montoMensual;

  AhorroProgramado({
    required this.nombre,
    required this.montoTotal,
    required this.dia,
    required this.periodo,
    required this.montoMensual,
  });
}
