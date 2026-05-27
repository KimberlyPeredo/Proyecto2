import 'package:flutter/material.dart';
import 'login_page.dart';

class ProfilePlaces extends StatelessWidget {
  final String username;
  const ProfilePlaces({
    super.key,
    required this.username,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // AVATAR
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 20),
              // USUARIO
              Text(
                username,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Bienvenido a Places App",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 40),
              // BOTON CERRAR SESION
              SizedBox(

                width: 220,

                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );

                  },
                  icon: const Icon(Icons.logout),
                  label: const Text(
                    "Cerrar sesión",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}