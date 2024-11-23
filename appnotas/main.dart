// main.dart
import 'package:flutter/material.dart';
import 'package:appnotas/screens/splashscreen.dart'; // Importa el archivo splashscreen.dart
import 'package:appnotas/screens/notes.dart'; // Importa el archivo notes.dart
import 'package:appnotas/theme/theme.dart'; // Importa el tema

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme, // Usa el tema claro
      darkTheme: AppTheme.darkTheme, // Usa el tema oscuro
      themeMode: ThemeMode.system, // Cambia según la configuración del sistema
      home: const SplashScreen(), // La primera pantalla será el SplashScreen
    );
  }
}

// Aquí tienes la pantalla que será el home después del splash
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ChatsScreen(); // Usa el ChatsScreen en lugar de la lista
  }
}