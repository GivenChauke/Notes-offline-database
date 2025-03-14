class Note {
  final int id;
  final String title;
  final String description;

  const Note({
    required this.id,
    required this.title,
    required this.description,
  });
  factory Note.fromJson(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      description: map['description'],
    );
  }
  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'description': description};
  }
}
