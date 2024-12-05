import 'dart:async'; // Importar Timer
import 'package:flutter/material.dart';
import 'package:appdenotas/screens/splashscreen.dart'; 
import 'package:appdenotas/screens/notes.dart'; 
import 'package:appdenotas/theme/theme.dart'; 
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; 
import 'package:appdenotas/screens/clima.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/notes': (context) => const NotesHomeScreen(),
        '/weather': (context) => const WeatherScreen(), 
      },
    );
  }
}
// Homescreen rediseñada y redefinida: panel de widgets que pemriten acceder a distintas funciones de la app: Panel de Notas, Calendario y Clima, visibilizar recordatorios en loop y config.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

//Timer que permite controlar loop widget de recordatorio en Home Dashboard 
class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Índice actual del recordatorio
  Timer? _timer; // Temporizador

  @override
  void initState() {
    super.initState();
    _startTimer(); // Inicia el temporizador
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancela el temporizador al salir de la pantalla
    super.dispose();
  }

  void _startTimer() {
    const duration = Duration(seconds: 5); // Cambia cada 5 segundos
    _timer = Timer.periodic(duration, (timer) {
      setState(() {
        _currentIndex++; // Incrementa el índice, leyendo cada nota que haya sido agregada
      });
    });
  }

  @override
  Widget build(BuildContext context) {
        final theme = Theme.of(context);
//Appbar 
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
               elevation: 0,
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: _buildGradientCard(
                      context,
                      title: 'Panel de Notas',
                      subtitle: 'Accede a todas tus notas',
                      icon: Icons.notes,
                      gradientColors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.primaryContainer,
                      ],
                      onTap: () => Navigator.pushNamed(context, '/notes'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildGradientCard(
                      context,
                      title: 'Configuración',
                      subtitle: 'Ajusta tu app',
                      icon: Icons.settings,
                      gradientColors: [
                        Theme.of(context).colorScheme.secondary,
                        Theme.of(context).colorScheme.secondaryContainer,
                      ],
                      onTap: () {
                        // Navegar a configuración (no es parte de la entrega ya que realmente no hace falta configurar nada)
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: _buildGradientCardWithCalendar(
                      context,
                      title: '5 de diciembre, Soleado 23°C',
                      subtitle: 'Fecha y Clima',
                      calendarIcon: Icons.calendar_today,
                      cloudIcon: Icons.cloud,
                      gradientColors: [
                        Theme.of(context).colorScheme.tertiary,
                        Theme.of(context).colorScheme.tertiaryContainer,
                      ],
                      onTap: () => Navigator.pushNamed(context, '/weather'), // Navega a la pantalla de clima para ver otras zonas y/o cambiar fecha de calendario
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 1,
                    child: _buildReminderCard(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
//Widget de recordatorio, hace un loop cada 5 segundos mostrando las notas que vemos en panel de notas también
  Widget _buildReminderCard(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('notas_rapidas').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildGradientCard(
            context,
            title: 'Cargando...',
            subtitle: 'Próximo Recordatorio',
            icon: Icons.alarm,
            gradientColors: [
              Theme.of(context).colorScheme.error,
              Theme.of(context).colorScheme.errorContainer,
            ],
            onTap: () {},
          );
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return _buildGradientCard(
            context,
            title: 'No hay recordatorios',
            subtitle: 'Próximo Recordatorio',
            icon: Icons.alarm,
            gradientColors: [
              Theme.of(context).colorScheme.error,
              Theme.of(context).colorScheme.errorContainer,
            ],
            onTap: () {},
          );
        }

        final quickNotes = snapshot.data!.docs;
        final noteIndex = _currentIndex % quickNotes.length; // Ciclo basado en el temporizador, permite leer todos los recordatorios en pestaña notes y notas rapidas
        final note = quickNotes[noteIndex];
        final title = note['titulo'] ?? 'Sin Título';

        return _buildGradientCard(
          context,
          title: title,
          subtitle: 'Próximo Recordatorio',
          icon: Icons.alarm,
          gradientColors: [
            Theme.of(context).colorScheme.error,
            Theme.of(context).colorScheme.errorContainer,
          ],
          onTap: () {
          
          },
        );
      },
    );
  }
// calendario dentro de pestaña fecha y clima
  Widget _buildGradientCardWithCalendar(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData calendarIcon,
    required IconData cloudIcon,
    required List<Color> gradientColors,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 6,
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(calendarIcon, size: 30, color: Colors.white),
                const SizedBox(width: 8),
                Icon(cloudIcon, size: 30, color: Colors.white),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white70,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGradientCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required List<Color> gradientColors,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 6,
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            const SizedBox(height: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white70,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
