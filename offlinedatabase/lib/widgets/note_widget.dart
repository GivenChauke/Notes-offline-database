import 'package:flutter/material.dart';
import 'package:offlinedatabase/models/note_model.dart';

class NoteWidget extends StatelessWidget {
  final Note note;
  final Function(Note) onDelete;
  final Function(Note) onUpdate;
  final Function(Note) onTap;
  final Function(Note) onLongPress;

  NoteWidget({
    Key? key,
    required this.note,
    required this.onDelete,
    required this.onUpdate,
    required this.onTap,
    required this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(note),
      onLongPress: () => onLongPress(note),
      child: Card(
        margin: EdgeInsets.all(8),
        child: ListTile(
          title: Text(note.title),
          subtitle: Text(note.description),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () => onUpdate(note),
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => onDelete(note),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
