import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final nController = TextEditingController();
  final aController = TextEditingController();
  final cController = TextEditingController();
  final uController = TextEditingController();
  final pController = TextEditingController();
  final cpController = TextEditingController();

  // En tu RegisterPage (Flutter)
  Future<void> registrar() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:8000/api/register'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'nombre': nController.text.trim(),
          'apellido': aController.text.trim(),
          'correo': cController.text.trim(),
          'usuario': uController.text.trim(),
          'contrasena': pController.text.trim(),
        }),
      );

      // MIRA AQUÍ LA RESPUESTA EN LA CONSOLA DE VS CODE
      print("Código: ${response.statusCode}");
      print("Respuesta: ${response.body}");

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Creado exitosamente")));
        Navigator.pop(context);
      } else {
        final data = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(data['message'] ?? 'Error')));
      }
    } catch (e) {
      print("Error catch: $e");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Crear cuenta")),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFormField(controller: nController, decoration: const InputDecoration(labelText: "Nombre")),
            TextFormField(controller: aController, decoration: const InputDecoration(labelText: "Apellido")),
            TextFormField(controller: cController, decoration: const InputDecoration(labelText: "Correo")),
            TextFormField(controller: uController, decoration: const InputDecoration(labelText: "Usuario")),
            TextFormField(controller: pController, decoration: const InputDecoration(labelText: "Contraseña"), obscureText: true),
            TextFormField(controller: cpController, decoration: const InputDecoration(labelText: "Confirmar"), obscureText: true),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: registrar, child: const Text("Registrar"))
          ],
        ),
      ),
    );
  }
}