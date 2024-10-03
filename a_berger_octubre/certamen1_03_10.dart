import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back), // flecha volver
            onPressed: () {
              // accion para boton
            },
          ),
          title: const Text('Opiniones sobre Tea Connection Salads...'), // texto superior
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // numero superior grande
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                '42',
                style: TextStyle(
                  fontSize: 70, 
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),


            // Comentarios
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Comentarios',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            // Comentario más grande
            Container(
              height: 190.0,
              width: double.infinity, // card full ancha
              decoration: BoxDecoration(
                color:  Colors.white,
              ),
              margin: const EdgeInsets.only(bottom: 20.0), // espacio bajo card mas grande
              padding: const EdgeInsets.all(16.0), // padding card mas grande
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar( // icono de persona
                    backgroundColor: Colors.grey,
                    radius: 30.0, 
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  const Expanded(
                    child: Text(
                      'No estoy exagerando los conté. El poke viene con 1 pedacito de mango y 3 edamame',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),


            // comentarios
            for (var i = 1; i <= 4; i++)
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person, // icono personita
                    color: Colors.white,
                  ),
                ),
                title: Text('Username $i'),
                subtitle: Text('Fecha $i'),
                subtitle: Text('comentario lorem ipsum $i'),
                trailing: const Icon(Icons.star), // icono de estrella
              ),
          ],
        ),
      ),
    );
  }
}
