class NoteModel {
  final String uuid;
  final String title;
  final String categoryUuid; // folder reference

  NoteModel({
    required this.uuid,
    required this.title,
    required this.categoryUuid,
  });

  Map<String, dynamic> toMap() => {
    'uuid': uuid,
    'title': title,
    'category_uuid': categoryUuid,
  };

  static const String tableName = 'note';

  static String get createTable => '''
  CREATE TABLE $tableName (
    uuid TEXT PRIMARY KEY,
    title TEXT NOT NULL,
    category_uuid TEXT NOT NULL,
    FOREIGN KEY (category_uuid) REFERENCES category (uuid) ON DELETE CASCADE
  )
''';
}
