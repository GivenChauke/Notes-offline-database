import 'package:flutter/material.dart';
import 'package:offlinedatabase/models/note_model.dart';
import 'package:offlinedatabase/widgets/note_widget.dart';
import 'package:offlinedatabase/services/database-helper.dart';

class NoteScreen extends StatefulWidget {
  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  List<Note> notes = [];
  //initialise db instance
  DatabaseHelper db = DatabaseHelper.instance;

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    final loadedNotes = await db.getAllNotes();
    setState(() {
      notes = loadedNotes;
    });
  }

  void _addOrUpdateNote({Note? note}) {
    TextEditingController titleController = TextEditingController(
      text: note?.title ?? '',
    );
    TextEditingController descController = TextEditingController(
      text: note?.description ?? '',
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(note == null ? 'Add Note' : 'Edit Note'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(hintText: 'Title'),
              ),
              TextField(
                controller: descController,
                decoration: InputDecoration(hintText: 'Description'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                final newNote = Note(
                  id: note?.id ?? DateTime.now().millisecondsSinceEpoch,
                  title: titleController.text,
                  description: descController.text,
                );
                if (note == null) {
                  await db.insert(newNote);
                } else {
                  await db.update(newNote);
                }
                _loadNotes();
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _deleteNote(Note note) async {
    await db.delete(note.id);
    _loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes')),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];
          return NoteWidget(
            note: note,
            onTap: (note) => _addOrUpdateNote(note: note),
            onLongPress: (note) => _deleteNote(note),
            onDelete: _deleteNote,
            onUpdate: (note) => _addOrUpdateNote(note: note),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _addOrUpdateNote(),
      ),
    );
  }
}
