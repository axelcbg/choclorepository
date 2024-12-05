import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Esta screen permite anotar cosas y cambiar el título de las notas, así como borrarlas. Simplemente eso. Es la funcionalidad principal de toda la app, permitiendo al usuario generar su propio input y contenido.
// puede servir al usuario para cualquier necesidad universal de anotacion
class NotaInputScreen extends StatefulWidget {
  final String noteId; // ID de la nota en Firestore

  const NotaInputScreen({super.key, required this.noteId});

  @override
  _NotaInputScreenState createState() => _NotaInputScreenState();
}

class _NotaInputScreenState extends State<NotaInputScreen> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _contentController = TextEditingController();
    _loadNoteData();
  }

  Future<void> _loadNoteData() async {
    final doc = await FirebaseFirestore.instance
        .collection('notas_lista')
        .doc(widget.noteId)
        .get();

    if (doc.exists) {
      _titleController.text = doc['titulo'] ?? 'Sin Título'; // Cargar el título
      _contentController.text = doc['contenido'] ?? ''; // Cargar el contenido
    }
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _updateNote() async {
    final updatedTitle = _titleController.text.trim();
    final updatedContent = _contentController.text.trim();

    if (updatedTitle.isNotEmpty) {
      await FirebaseFirestore.instance.collection('notas_lista').doc(widget.noteId).update({
        'titulo': updatedTitle,
        'contenido': updatedContent,
      });
    }
  }

  Future<void> _deleteNote() async {
    await FirebaseFirestore.instance.collection('notas_lista').doc(widget.noteId).delete();
    Navigator.of(context).pop(); // Regresar a la pantalla anterior
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Nota'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: _deleteNote,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Título',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: TextField(
                controller: _contentController,
                maxLines: null,
                expands: true,
                textAlign: TextAlign.start, // Alinea el texto a la izquierda
                textAlignVertical: TextAlignVertical.top, // Alinea el texto hacia arriba
                decoration: const InputDecoration(
                  labelText: 'Contenido',
                  alignLabelWithHint: true, // Asegura que el label esté arriba
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateNote,
        child: const Icon(Icons.save),
      ),
    );
  }
}
