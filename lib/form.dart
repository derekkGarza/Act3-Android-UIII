import 'package:flutter/material.dart';
import 'package:myapp/details.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  // Crea un TextEditingController único para cada campo de texto
  final TextEditingController _idProvedorController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _productoController = TextEditingController();
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _idSucursalController = TextEditingController();

  @override
  void dispose() {
    // Asegúrate de desechar todos los controladores cuando el widget se desmonte
    _idProvedorController.dispose();
    _nombreController.dispose();
    _telefonoController.dispose();
    _productoController.dispose();
    _direccionController.dispose();
    _idSucursalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.deepPurple.shade300,
            title: const Text("Provedor"),
            centerTitle: true),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              MyTextField(
                  myController: _idProvedorController, // Asigna un controlador único
                  fieldName: "Id Provedor",
                  myIcon: Icons.account_balance,
                  prefixIconColor: Colors.deepPurple.shade300),
              const SizedBox(height: 10.0),
              MyTextField(
                  myController: _nombreController, // Asigna un controlador único
                  fieldName: "Nombre",
                  myIcon: Icons.person,
                  prefixIconColor: Colors.deepPurple.shade300),
              const SizedBox(height: 10.0),
              MyTextField(
                  myController: _telefonoController, // Asigna un controlador único
                  fieldName: "Telefono",
                  myIcon: Icons.calendar_month,
                  prefixIconColor: Colors.deepPurple.shade300),
              const SizedBox(height: 10.0),
              MyTextField(
                  myController: _productoController, // Asigna un controlador único
                  fieldName: "Correo",
                  myIcon: Icons.phone,
                  prefixIconColor: Colors.deepPurple.shade300),
              const SizedBox(height: 10.0),
              MyTextField(
                  myController: _direccionController, // Asigna un controlador único
                  fieldName: "Telefono",
                  myIcon: Icons.email,
                  prefixIconColor: Colors.deepPurple.shade300),
              const SizedBox(height: 10.0),
              MyTextField(
                  myController: _idSucursalController, // Asigna un controlador único
                  fieldName: "Direccion",
                  myIcon: Icons.house,
                  prefixIconColor: Colors.deepPurple.shade300),
              
              const SizedBox(height: 20.0),
              myBtn(context),
            ],
          ),
        ));
  }

  //Function that returns OutlinedButton Widget also it pass data to Details Screen
  OutlinedButton myBtn(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return Details(
              // Pasa el texto de cada controlador individualmente
              productName: _idProvedorController.text, // Ejemplo: Aquí podrías pasar el ID del cliente o un nombre consolidado si lo deseas
              productDescription: _nombreController.text, // Ejemplo: Aquí podrías pasar el nombre completo
            );
          }),
        );
      },
      child: Text(
        "Submit Form".toUpperCase(),
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.deepPurple),
      ),
    );
  }
}

//Custom STateless WIdget Class that helps re-usability
// You can learn it in Tutorial (2.13) Custom Widget in Flutter
// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
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
          labelStyle: const TextStyle(color: Colors.deepPurple)),
    );
  }
}