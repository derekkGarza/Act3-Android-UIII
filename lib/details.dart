import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final String idDistribuidor;
  final String nombreDistribuidor;
  final String costoEntrega;
  final String entregas;
  final String telefono;
  final String correoElectronico;
  final String ciudad;

  const Details({
    Key? key,
    required this.idDistribuidor,
    required this.nombreDistribuidor,
    required this.costoEntrega,
    required this.entregas,
    required this.telefono,
    required this.correoElectronico,
    required this.ciudad,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Detalles del Distribuidor"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.deepPurple.shade300,
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ListTile(
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1.0, color: Colors.grey.shade300),
              ),
              leading: const Icon(Icons.person, color: Colors.blueAccent),
              title: const Text(
                "Información del Distribuidor",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  '''
ID Distribuidor: $idDistribuidor
Nombre: $nombreDistribuidor
Teléfono: $telefono
Correo Electrónico: $correoElectronico
Ciudad: $ciudad
Costo de Entrega: $costoEntrega
Número de Entregas: $entregas
''',
                  style: const TextStyle(height: 1.5),
                ),
              ),
              trailing: const Icon(
                Icons.delete,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}