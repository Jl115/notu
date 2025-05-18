class NoteModel {
  final int? id;
  final String title;
  final String content;

  NoteModel({this.id, required this.title, required this.content});

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'content': content,
  };

  static const String tableName = 'note';

  static String get createTable => '''
    CREATE TABLE $tableName (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT NOT NULL,
      content TEXT NOT NULL
    )
  ''';
}
