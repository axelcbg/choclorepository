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
            icon: const Icon(Icons.arrow_back), // flecha de atras
            onPressed: () {
              // accion de presionar boton atras
            },
          ),
          title: const Text('Opiniones sobre Tea Connection Salads...'), // texto superior
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // numero grande
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

            // header de comentarios
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
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Todos'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Positivos'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Negativos'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    ),
                  ),
                ],
              ),
            ),

            // card de comentario mas grande
            Container(
              height: 190.0,
              width: double.infinity, // ancho full
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              margin: const EdgeInsets.only(bottom: 20.0), // espacio bajo la
              padding: const EdgeInsets.all(16.0), // padding dentro de la card
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar( // icono avatar
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

            // lista de comentarios 
            for (var i = 1; i <= 4; i++)
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  'Username $i',
                  style: const TextStyle(fontSize: 18), 
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fecha $i',
                      style: const TextStyle(fontSize: 16), 
                    ),
                    Text('Comentario lorem ipsum $i'), 
                  ],
                ),
                trailing: const Icon(Icons.star),
              ),
          ],
        ),
      ),
    );
  }
}
