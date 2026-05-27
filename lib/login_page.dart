import 'package:flutter/material.dart';
import 'package:places/places_cupertino.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();

  final usuarioController = TextEditingController();
  final passwordController = TextEditingController();

  bool ocultarPassword = true;

  void login() {

    if (_formKey.currentState!.validate()) {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PlacesCupertino(
            username: usuarioController.text,
          ),
        ),
      );

    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(

        width: double.infinity,
        height: double.infinity,

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF6A11CB),
              Color(0xFF2575FC),
            ],
          ),
        ),

        child: Center(

          child: SingleChildScrollView(

            child: Container(

              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(25),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),

              child: Form(

                key: _formKey,

                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  children: [

                    const Icon(
                      Icons.location_on,
                      size: 80,
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Places App",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // USUARIO
                    TextFormField(

                      controller: usuarioController,

                      validator: (value) {

                        if(value == null || value.isEmpty){
                          return "Ingrese usuario";
                        }

                        if(value.contains(" ")){
                          return "Sin espacios";
                        }

                        return null;
                      },

                      decoration: InputDecoration(

                        labelText: "Usuario",

                        prefixIcon: const Icon(Icons.person),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),

                      ),
                    ),

                    const SizedBox(height: 15),

                    // PASSWORD
                    TextFormField(

                      controller: passwordController,

                      obscureText: ocultarPassword,

                      validator: (value) {

                        if(value == null || value.isEmpty){
                          return "Ingrese contraseña";
                        }

                        if(value.length < 6){
                          return "Mínimo 6 caracteres";
                        }

                        return null;
                      },

                      decoration: InputDecoration(

                        labelText: "Contraseña",

                        prefixIcon: const Icon(Icons.lock),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),

                        suffixIcon: IconButton(

                          icon: Icon(
                            ocultarPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),

                          onPressed: () {

                            setState(() {
                              ocultarPassword = !ocultarPassword;
                            });

                          },
                        ),
                      ),
                    ),

                    // OLVIDE PASSWORD
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(

                        onPressed: () {

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Próximamente disponible",
                              ),
                            ),
                          );

                        },

                        child: const Text(
                          "¿Olvidaste tu contraseña?",
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // BOTON LOGIN
                    SizedBox(

                      width: double.infinity,

                      child: FilledButton(

                        onPressed: login,

                        child: const Text(
                          "Ingresar",
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // CREAR CUENTA
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [

                        const Text(
                          "¿No tienes cuenta?",
                        ),

                        TextButton(

                          onPressed: () {

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterPage(),
                              ),
                            );

                          },

                          child: const Text(
                            "Crear cuenta",
                          ),
                        ),

                      ],
                    )

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}