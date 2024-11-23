// screens/notes.dart
import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          'Whatsapp',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: const [
          ListTile(
            leading: CircleAvatar(child: Text('G')), // Germán
            title: Text('Germán', style: TextStyle(color: Colors.black)),
            trailing: Icon(Icons.more_vert),
            tileColor: Colors.white,
          ),
          ListTile(
            leading: CircleAvatar(child: Text('S')), // Sofía
            title: Text('Sofía', style: TextStyle(color: Colors.black)),
            trailing: Icon(Icons.more_vert),
            tileColor: Colors.white,
          ),
          ListTile(
            leading: CircleAvatar(child: Text('P')), // Pedro
            title: Text('Pedro', style: TextStyle(color: Colors.black)),
            trailing: Icon(Icons.more_vert),
            tileColor: Colors.white,
          ),
          ListTile(
            leading: CircleAvatar(child: Text('I')), // Isidora
            title: Text('Isidora', style: TextStyle(color: Colors.black)),
            trailing: Icon(Icons.more_vert),
            tileColor: Colors.white,
          ),
          ListTile(
            leading: CircleAvatar(child: Text('A')), // Antonia
            title: Text('Antonia', style: TextStyle(color: Colors.black)),
            trailing: Icon(Icons.more_vert),
            tileColor: Colors.white,
          ),
          ListTile(
            leading: CircleAvatar(child: Text('B')), // Benjamín
            title: Text('Benjamín', style: TextStyle(color: Colors.black)),
            trailing: Icon(Icons.more_vert),
            tileColor: Colors.white,
          ),
          ListTile(
            leading: CircleAvatar(child: Text('J')), // Josefina
            title: Text('Josefina', style: TextStyle(color: Colors.black)),
            trailing: Icon(Icons.more_vert),
            tileColor: Colors.white,
          ),
          ListTile(
            leading: CircleAvatar(child: Text('S')), // Sophia
            title: Text('Sophia', style: TextStyle(color: Colors.black)),
            trailing: Icon(Icons.more_vert),
            tileColor: Colors.white,
          ),
          ListTile(
            leading: CircleAvatar(child: Text('D')), // Daniela
            title: Text('Daniela', style: TextStyle(color: Colors.black)),
            trailing: Icon(Icons.more_vert),
            tileColor: Colors.white,
          ),
          ListTile(
            leading: CircleAvatar(child: Text('A')), // Axel
            title: Text('Axel', style: TextStyle(color: Colors.black)),
            trailing: Icon(Icons.more_vert),
            tileColor: Colors.white,
          ),
          ListTile(
            leading: CircleAvatar(child: Text('F')), // Francisca
            title: Text('Francisca', style: TextStyle(color: Colors.black)),
            trailing: Icon(Icons.more_vert),
            tileColor: Colors.white,
          ),
          ListTile(
            leading: CircleAvatar(child: Text('G')), // Germán
            title: Text('Germán', style: TextStyle(color: Colors.black)),
            trailing: Icon(Icons.more_vert),
            tileColor: Colors.white,
          ),
          ListTile(
            leading: CircleAvatar(child: Text('S')), // Sofía
            title: Text('Sofía', style: TextStyle(color: Colors.black)),
            trailing: Icon(Icons.more_vert),
            tileColor: Colors.white,
          ),
          ListTile(
            leading: CircleAvatar(child: Text('P')), // Pedro
            title: Text('Pedro', style: TextStyle(color: Colors.black)),
            trailing: Icon(Icons.more_vert),
            tileColor: Colors.white,
          ),
          ListTile(
            leading: CircleAvatar(child: Text('I')), // Isidora
            title: Text('Isidora', style: TextStyle(color: Colors.black)),
            trailing: Icon(Icons.more_vert),
            tileColor: Colors.white,
          ),
          ListTile(
            leading: CircleAvatar(child: Text('A')), // Antonia
            title: Text('Antonia', style: TextStyle(color: Colors.black)),
            trailing: Icon(Icons.more_vert),
            tileColor: Colors.white,
          ),
          ListTile(
            leading: CircleAvatar(child: Text('B')), // Benjamín
            title: Text('Benjamín', style: TextStyle(color: Colors.black)),
            trailing: Icon(Icons.more_vert),
            tileColor: Colors.white,
          ),
          ListTile(
            leading: CircleAvatar(child: Text('J')), // Josefina
            title: Text('Josefina', style: TextStyle(color: Colors.black)),
            trailing: Icon(Icons.more_vert),
            tileColor: Colors.white,
          ),
          ListTile(
            leading: CircleAvatar(child: Text('S')), // Sophia
            title: Text('Sophia', style: TextStyle(color: Colors.black)),
            trailing: Icon(Icons.more_vert),
            tileColor: Colors.white,
          ),
          ListTile(
            leading: CircleAvatar(child: Text('D')), // Daniela
            title: Text('Daniela', style: TextStyle(color: Colors.black)),
            trailing: Icon(Icons.more_vert),
            tileColor: Colors.white,
          ),
          ListTile(
            leading: CircleAvatar(child: Text('A')), // Axel
            title: Text('Axel', style: TextStyle(color: Colors.black)),
            trailing: Icon(Icons.more_vert),
            tileColor: Colors.white,
          ),
          ListTile(
            leading: CircleAvatar(child: Text('F')), // Francisca
            title: Text('Francisca', style: TextStyle(color: Colors.black)),
            trailing: Icon(Icons.more_vert),
            tileColor: Colors.white,
          ),
        ],
      ),
    );
  }
}