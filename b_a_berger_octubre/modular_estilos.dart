import 'package:flutter/material.dart';
import 'package:modular_estilos/main.dart'; // Importa MainApp

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacity = 1.0; // Opacidad inicial

  @override
  void initState() {
    super.initState();
    // Inicia la animación
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        opacity = 0.0; // Cambia la opacidad a 0
      });
    });

    // Navega a HomeScreen después de la espera y la animación
    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }); // Future.delayed
  } // Future.delayed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 500), // Duración de la animación
          opacity: opacity,
          child: const Text(
            'Soy el Splashscreen',
            style: TextStyle(fontSize: 24),
          ), // Text
        ), // AnimatedOpacity
      ), // Center
    ); // Scaffold
  }
}
