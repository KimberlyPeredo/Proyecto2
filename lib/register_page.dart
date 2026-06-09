import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

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

  Future<void> registrarUsuario() async {
    if (!_formKey.currentState!.validate()) return;

    if (passwordController.text != confirmarController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Las contraseñas no coinciden")),
      );
      return;
    }

    final baseUrl = "http://127.0.0.1:8000";

    final url = Uri.parse('$baseUrl/api/register');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'nombre': nombreController.text.trim(),
          'apellido': apellidoController.text.trim(),
          'correo': correoController.text.trim(),
          'usuario': usuarioController.text.trim(),
          'contrasena': passwordController.text.trim(),
        }),
      );

      print("STATUS: ${response.statusCode}");
      print("BODY: ${response.body}");

      if (response.body.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Respuesta vacía del servidor")),
        );
        return;
      }

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(data["message"] ?? "Usuario creado correctamente"),
          ),
        );
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(data["message"] ?? "Error al registrar usuario"),
          ),
        );
      }
    } catch (e) {
      print("ERROR REAL: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No se pudo conectar al servidor")),
      );
    }
  }
  @override
  void dispose() {
    nombreController.dispose();
    apellidoController.dispose();
    correoController.dispose();
    usuarioController.dispose();
    passwordController.dispose();
    confirmarController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Crear cuenta")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Icon(Icons.person_add,
                    size: 80, color: Colors.deepPurple),

                const SizedBox(height: 20),
                TextFormField(
                  controller: nombreController,
                  validator: (value) =>
                  value!.isEmpty ? "Ingrese nombre" : null,
                  decoration: const InputDecoration(
                    labelText: "Nombre",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),
                TextFormField(
                  controller: apellidoController,
                  validator: (value) =>
                  value!.isEmpty ? "Ingrese apellido" : null,
                  decoration: const InputDecoration(
                    labelText: "Apellido",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),
                TextFormField(
                  controller: correoController,
                  validator: (value) =>
                  value!.isEmpty ? "Ingrese correo" : null,
                  decoration: const InputDecoration(
                    labelText: "Correo",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),
                TextFormField(
                  controller: usuarioController,
                  validator: (value) =>
                  value!.isEmpty ? "Ingrese usuario" : null,
                  decoration: const InputDecoration(
                    labelText: "Usuario",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),
                TextFormField(
                  controller: passwordController,
                  obscureText: ocultar1,
                  validator: (value) =>
                  value!.isEmpty ? "Ingrese contraseña" : null,
                  decoration: InputDecoration(
                    labelText: "Contraseña",
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        ocultar1 ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () =>
                          setState(() => ocultar1 = !ocultar1),
                    ),
                  ),
                ),

                const SizedBox(height: 15),
                TextFormField(
                  controller: confirmarController,
                  obscureText: ocultar2,
                  validator: (value) =>
                  value!.isEmpty ? "Confirme contraseña" : null,
                  decoration: InputDecoration(
                    labelText: "Confirmar contraseña",
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        ocultar2 ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () =>
                          setState(() => ocultar2 = !ocultar2),
                    ),
                  ),
                ),

                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: registrarUsuario,
                    child: const Text("Crear cuenta"),
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