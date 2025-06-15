import 'package:flutter/material.dart';
import 'details.dart'; // Asegúrate de tener este archivo creado

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _idDistribuidorController = TextEditingController();
  final _nombreDistribuidorController = TextEditingController();
  final _costoEntregaController = TextEditingController();
  final _entregasController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _correoElectronicoController = TextEditingController();
  final _ciudadController = TextEditingController();

  @override
  void dispose() {
    _idDistribuidorController.dispose();
    _nombreDistribuidorController.dispose();
    _costoEntregaController.dispose();
    _entregasController.dispose();
    _telefonoController.dispose();
    _correoElectronicoController.dispose();
    _ciudadController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade300,
        title: const Text("Formulario Distribuidor"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            MyTextField(
              myController: _idDistribuidorController,
              fieldName: "ID Distribuidor",
              myIcon: Icons.person_outline,
              prefixIconColor: Colors.deepPurple.shade300,
            ),
            const SizedBox(height: 10.0),

            MyTextField(
              myController: _nombreDistribuidorController,
              fieldName: "Nombre del Distribuidor",
              myIcon: Icons.person,
              prefixIconColor: Colors.deepPurple.shade300,
            ),
            const SizedBox(height: 10.0),

            MyTextField(
              myController: _costoEntregaController,
              fieldName: "Costo de Entrega",
              myIcon: Icons.attach_money,
              prefixIconColor: Colors.deepPurple.shade300,
            ),
            const SizedBox(height: 10.0),

            MyTextField(
              myController: _entregasController,
              fieldName: "Número de Entregas",
              myIcon: Icons.local_shipping,
              prefixIconColor: Colors.deepPurple.shade300,
            ),
            const SizedBox(height: 10.0),

            MyTextField(
              myController: _telefonoController,
              fieldName: "Teléfono",
              myIcon: Icons.phone,
              prefixIconColor: Colors.deepPurple.shade300,
            ),
            const SizedBox(height: 10.0),

            MyTextField(
              myController: _correoElectronicoController,
              fieldName: "Correo Electrónico",
              myIcon: Icons.email,
              prefixIconColor: Colors.deepPurple.shade300,
            ),
            const SizedBox(height: 10.0),

            MyTextField(
              myController: _ciudadController,
              fieldName: "Ciudad",
              myIcon: Icons.location_city,
              prefixIconColor: Colors.deepPurple.shade300,
            ),
            const SizedBox(height: 20.0),

            myBtn(context),
          ],
        ),
      ),
    );
  }

  OutlinedButton myBtn(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Details(
                idDistribuidor: _idDistribuidorController.text,
                nombreDistribuidor: _nombreDistribuidorController.text,
                costoEntrega: _costoEntregaController.text,
                entregas: _entregasController.text,
                telefono: _telefonoController.text,
                correoElectronico: _correoElectronicoController.text,
                ciudad: _ciudadController.text,
              );
            },
          ),
        );
      },
      child: Text(
        "Enviar Formulario".toUpperCase(),
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.deepPurple),
      ),
    );
  }
}

// Widget personalizado para TextFormField
// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  MyTextField({
    Key? key,
    required this.fieldName,
    required this.myController,
    this.myIcon = Icons.verified_user_outlined,
    this.prefixIconColor = Colors.blueAccent,
  });

  final TextEditingController myController;
  String fieldName;
  final IconData myIcon;
  Color prefixIconColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      decoration: InputDecoration(
        labelText: fieldName,
        prefixIcon: Icon(myIcon, color: prefixIconColor),
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple.shade300),
        ),
        labelStyle: const TextStyle(color: Colors.deepPurple),
      ),
    );
  }
}