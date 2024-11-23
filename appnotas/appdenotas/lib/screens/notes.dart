import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:appdenotas/screens/nota_input.dart';

// Esta es la interfaz simple y principal que en un listado de notas. A cada nota agregada se le puede poner título, editar el contenido y borrar siendo apilables. Además se adjunta una fecha de creación.


class NotesHomeScreen extends StatelessWidget {
  const NotesHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes App'),
        elevation: 0,
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('notas_lista').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No hay notas disponibles'));
          }
          final notes = snapshot.data!.docs;
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];
              final name = note['titulo'] ?? 'Sin título';
              final timestamp = (note['fecha_creacion'] as Timestamp).toDate();

              return ListTile(
                leading: const Icon(Icons.notes),
                title: Text(name),
                subtitle: Text(
                    '${timestamp.day}-${timestamp.month}-${timestamp.year} ${timestamp.hour}:${timestamp.minute}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        // Navega a la pantalla de edición
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                NotaInputScreen(noteId: note.id),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        // Elimina la nota
                        FirebaseFirestore.instance
                            .collection('notas_lista')
                            .doc(note.id)
                            .delete();
                      },
                    ),
                  ],
                ),
                onTap: () {
                  // Opcional: también navega a la edición si se toca el ListTile
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          NotaInputScreen(noteId: note.id),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddNoteDialog(context),
        backgroundColor: theme.colorScheme.primary,
        child: const Icon(Icons.add),
      ),
    );
  }

void _showAddNoteDialog(BuildContext context) {
  final nameController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Añadir Nota'),
        content: TextField(
          controller: nameController,
          decoration: const InputDecoration(labelText: 'Título de Nota'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final title = nameController.text.trim();
              if (title.isNotEmpty) {
                // Agrega el campo contenido con un valor inicial vacío
                FirebaseFirestore.instance.collection('notas_lista').doc(title).set({
                  'titulo': title,
                  'fecha_creacion': Timestamp.now(),
                  'contenido': '', // Valor inicial para contenido
                });
              }
              Navigator.of(context).pop();
            },
            child: const Text('Añadir'),
          ),
        ],
      );
    },
  );
}

}