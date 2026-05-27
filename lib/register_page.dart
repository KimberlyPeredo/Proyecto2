import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // IMPORTANTE: Agregado para conexión
import 'dart:convert'; // IMPORTANTE: Agregado para convertir a formato JSON

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final nombreController = TextEditingController();
  final apellidoController = TextEditingController();
  final correoController = TextEditingController();
  final usuarioController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmarController = TextEditingController();

  bool ocultar1 = true;
  bool ocultar2 = true;

  // FUNCIÓN QUE CONECTA CON TU SERVIDOR
  Future<void> registrarUsuario() async {
    final url = Uri.parse('http://api.kptechsoport.com/api/register');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': nombreController.text,
          'apellido': apellidoController.text,
          'email': correoController.text,
          'username': usuarioController.text,
          'password': passwordController.text,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Cuenta creada correctamente en el servidor")),
          );
          Navigator.pop(context);
        }
      } else {
        print("Error del servidor: ${response.body}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${response.statusCode}")),
        );
      }
    } catch (e) {
      print("Error de conexión: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("No se pudo conectar al servidor")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crear cuenta"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20),
                Icon(Icons.person_add, size: 80, color: Color(0xFF574ACF)),
                SizedBox(height: 20),
                TextFormField(controller: nombreController, decoration: InputDecoration(labelText: "Nombre", border: OutlineInputBorder())),
                SizedBox(height: 15),
                TextFormField(controller: apellidoController, decoration: InputDecoration(labelText: "Apellido", border: OutlineInputBorder())),
                SizedBox(height: 15),
                TextFormField(controller: correoController, decoration: InputDecoration(labelText: "Correo", border: OutlineInputBorder())),
                SizedBox(height: 15),
                TextFormField(controller: usuarioController, decoration: InputDecoration(labelText: "Usuario", border: OutlineInputBorder())),
                SizedBox(height: 15),
                TextFormField(
                  controller: passwordController,
                  obscureText: ocultar1,
                  decoration: InputDecoration(
                    labelText: "Contraseña",
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(ocultar1 ? Icons.visibility : Icons.visibility_off),
                      onPressed: () => setState(() => ocultar1 = !ocultar1),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: confirmarController,
                  obscureText: ocultar2,
                  decoration: InputDecoration(
                    labelText: "Confirmar contraseña",
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(ocultar2 ? Icons.visibility : Icons.visibility_off),
                      onPressed: () => setState(() => ocultar2 = !ocultar2),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF574ACF),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () {
                      // Validación antes de enviar
                      if (passwordController.text == confirmarController.text) {
                        registrarUsuario(); // LLAMADA A LA FUNCIÓN DE CONEXIÓN
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Las contraseñas no coinciden")),
                        );
                      }
                    },
                    child: Text("Crear cuenta"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}