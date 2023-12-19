import 'package:flutter/material.dart';
import 'ahorrosprogramados.dart'; // Importa el nuevo archivo
import 'PaginaUsuario.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PagSaldo(),
    );
  }
}

class PagSaldo extends StatefulWidget {
  @override
  _PagSaldoState createState() => _PagSaldoState();
}

class _PagSaldoState extends State<PagSaldo> {
  double saldoActual = 0.0;
  List<Movimiento> movimientos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/Logo_Proyecto1.png',
              height: 40.0,
            ),
            SizedBox(width: 8.0),
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
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFEBEFFA), // Color de fondo #ebeffa
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.0),
                color: Colors.white,
                child: Text(
                  'Saldo Actual: \$${saldoActual.toStringAsFixed(2)} CLP',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans-Regular',
                      color: Color(0xFF27348B)),
                ),
              ),
              SizedBox(height: 20.0),

              
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.0),
                color: Colors.white,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal, // Desplazamiento horizontal
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Movimientos de Dinero:',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans-Regular',
                            color: Color(0xFF27348B)),
                      ),
                      SizedBox(height: 10.0),
                      SingleChildScrollView(
                        child: DataTable(
                          columns: [
                            DataColumn(label: Text('Fecha')),
                            DataColumn(label: Text('Monto')),
                            DataColumn(label: Text('Descripción')),
                          ],
                          rows: movimientos.map((movimiento) {
                            return DataRow(cells: [
                              DataCell(Text(DateTime.now().toString())),
                              DataCell(Text(
                                  '${_obtenerSigno(movimiento.tipo)}\$${movimiento.monto.toStringAsFixed(2)}')),
                              DataCell(Text(movimiento.descripcion)),
                            ]);
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Sección de Añadir Gasto del Día
              SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.0),
                    Text(
                      'Añadir Gasto del Día:',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans-Regular',
                        color: Color(0xFF27348B),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        _mostrarDialogoAgregarMovimiento(context, 'Gasto');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent, // Sin relleno
                        onPrimary: Color(0xFF27348B), // Color del texto
                        elevation: 0, // Sin sombra
                        side: BorderSide(
                            color: Color(0xFF27348B)), // Borde del botón
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.add, color: Color(0xFF27348B)),
                          SizedBox(width: 8.0),
                          Text(
                            'Añadir Gasto',
                            style: TextStyle(
                              fontFamily: 'OpenSans-Regular',
                              color: Color(0xFF27348B),
                            ),
                          ),
                        ],
                      ),
                    ),


                    SizedBox(height: 20.0),
                    Text(
                      'Añadir Ingreso del Día:',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans-Regular',
                        color: Color(0xFF27348B),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        _mostrarDialogoAgregarMovimiento(context, 'Ingreso');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent, // Sin relleno
                        onPrimary: Color(0xFF27348B), // Color del texto
                        elevation: 0, // Sin sombra
                        side: BorderSide(color: Color(0xFF27348B)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.add, color: Color(0xFF27348B)),
                          SizedBox(width: 8.0),
                          Text('Añadir Ingreso',
                              style: TextStyle(
                                fontFamily: 'OpenSans-Regular',
                                color: Color(0xFF27348B),
                              )),
                        ],
                      ),
                    ),

                    SizedBox(height: 20.0),
                    Text(
                      'Añadir Movimiento Mensual:',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans-Regular',
                        color: Color(0xFF27348B),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        _mostrarDialogoAgregarMovimientoMensual(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent, // Sin relleno
                        onPrimary: Color(0xFF27348B), // Color del texto
                        elevation: 0, // Sin sombra
                        side: BorderSide(color: Color(0xFF27348B)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.add, color: Color(0xFF27348B)),
                          SizedBox(width: 8.0),
                          Text('Añadir Movimiento Mensual',
                              style: TextStyle(
                                fontFamily: 'OpenSans-Regular',
                                color: Color(0xFF27348B),
                              )),
                        ],
                      ),
                    ),

                    SizedBox(height: 20.0),
                    Text(
                      '¿Necesitas Ahorrar?',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans-Regular',
                        color: Color(0xFF27348B),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AhorrosProgramados()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent, // Sin relleno
                        onPrimary: Color(0xFF27348B), // Color del texto
                        elevation: 0, // Sin sombra
                        side: BorderSide(
                            color: Color(0xFF27348B)), // Borde del botón
                      ),
                      child: Text('Ahorros Programados',
                          style: TextStyle(
                            fontFamily: 'OpenSans-Regular',
                            color: Color(0xFF27348B),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _obtenerSigno(String tipo) {
    return tipo == 'Gasto' ? '' : '+';
  }

  Future<void> _mostrarDialogoAgregarMovimiento(
      BuildContext context, String tipo) async {
    double monto = 0.0;
    String descripcion = '';

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(Icons.add),
              SizedBox(width: 8.0),
              Text(
                'Añadir $tipo del Día',
                style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'OpenSans-Regular',
                    color: Color(0xFF27348B)),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    monto = double.tryParse(value) ?? 0.0;
                  },
                  decoration: InputDecoration(
                    labelText: 'Monto',
                    prefixIcon: Icon(Icons.attach_money),
                  ),
                ),
                TextField(
                  onChanged: (value) {
                    descripcion = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Descripción',
                    prefixIcon: Icon(Icons.description),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                agregarMovimiento(monto, descripcion, tipo);
                Navigator.of(context).pop();
              },
              child: Text('Aceptar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _mostrarDialogoAgregarMovimientoMensual(
      BuildContext context) async {
    String nombre = '';
    double monto = 0.0;
    int periodo = 0;
    int dia = 1;
    String descripcion = '';

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(Icons.add),
              SizedBox(width: 8.0),
              Text(
                'Añadir Movimiento',
                style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'OpenSans-Regular',
                    color: Color(0xFF27348B)),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  onChanged: (value) {
                    nombre = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                    prefixIcon: Icon(Icons.description),
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    monto = double.tryParse(value) ?? 0.0;
                  },
                  decoration: InputDecoration(
                    labelText: 'Monto',
                    prefixIcon: Icon(Icons.attach_money),
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    periodo = int.tryParse(value) ?? 1;
                  },
                  decoration: InputDecoration(
                    labelText: 'Periodo (meses)',
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    dia = int.tryParse(value) ?? 1;
                  },
                  decoration: InputDecoration(
                    labelText: 'Día del Mes',
                    prefixIcon: Icon(Icons.today),
                  ),
                ),
                TextField(
                  onChanged: (value) {
                    descripcion = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Descripción',
                    prefixIcon: Icon(Icons.description),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                agregarMovimientoMensual(
                    nombre, monto, periodo, dia, descripcion);
                Navigator.of(context).pop();
              },
              child: Text('Aceptar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  void agregarMovimiento(double monto, String descripcion, String tipo) {
    setState(() {
      movimientos.add(Movimiento(
        monto: tipo == 'Gasto' ? -monto : monto,
        descripcion: descripcion,
        tipo: tipo,
      ));
    });
    _actualizarSaldo();
  }

  void agregarMovimientoMensual(
      String nombre, double monto, int periodo, int dia, String descripcion) {
    setState(() {
      movimientos.add(Movimiento(
        monto: monto,
        descripcion: descripcion,
        tipo: 'Mensual',
        esMensual: true,
        nombre: nombre,
        periodo: periodo,
        dia: dia,
      ));
    });
    _actualizarSaldo();
  }

  void _actualizarSaldo() {
    double nuevoSaldo = 0.0;
    for (var movimiento in movimientos) {
      nuevoSaldo += movimiento.monto;
    }
    setState(() {
      saldoActual = nuevoSaldo;
    });
  }
}

class Movimiento {
  double monto;
  String descripcion;
  String tipo;
  bool esMensual;
  String nombre;
  int periodo;
  int dia;

  Movimiento({
    required this.monto,
    required this.descripcion,
    required this.tipo,
    this.esMensual = false,
    this.nombre = '',
    this.periodo = 0,
    this.dia = 1,
  });
}
