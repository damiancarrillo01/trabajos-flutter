import 'package:flutter/material.dart';

class PaginaUsuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEBEFFA),
        title: Row(
          children:[
            SizedBox(width: 8.0),
            Text('Usuario'),
          ],
        ),
      ),
      body: Container(
        color: Color(0xFFEBEFFA), // Color de fondo #ebeffa
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: Image(
                    image: AssetImage('assets/usuario.png'),
                    width: 50.0,
                    height: 50.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Nombre: Tu Nombre',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'Correo Electrónico: tu_correo@example.com',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // lógica para editar el perfil
                },
                child: Text('Editar Perfil'),
              ),
              SizedBox(height: 16.0),
              Text(
                'Configuraciones:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SwitchListTile(
                title: Text('Notificaciones'),
                value: true,
                onChanged: (value) {
                  //lógica para cambiar la configuración de notificaciones
                },
              ),
              SwitchListTile(
                title: Text('Modo Oscuro'),
                value: false,
                onChanged: (value) {
                  //lógica para cambiar la configuración de modo oscuro
                },
              ),
              SizedBox(height: 16.0),
              Text(
                'Movimientos Mensuales:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Nombre')),
                    DataColumn(label: Text('Monto')),
                    DataColumn(label: Text('Día')),
                    DataColumn(label: Text('Periodo')),
                    DataColumn(label: Text('Descripción')),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('Nombre1')),
                      DataCell(Text('\$500')),
                      DataCell(Text('1')),
                      DataCell(Text('Mensual')),
                      DataCell(Text('Descripción1')),
                    ]),
                   
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  //lógica para editar las mensualidades
                },
                child: Text('Editar Mensualidades'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
