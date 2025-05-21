class NoteModel {
  final String uuid;
  final String title;
  final String? categoryUuid; // nullable = uncategorized
  final DateTime createdAt;
  final DateTime updatedAt;

  NoteModel({
    required this.uuid,
    required this.title,
    this.categoryUuid,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() => {
    'uuid': uuid,
    'title': title,
    'category_uuid': categoryUuid,
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt.toIso8601String(),
  };

  static const String tableName = 'note';

  static String get createTable => '''
    CREATE TABLE $tableName (
      uuid TEXT PRIMARY KEY,
      title TEXT NOT NULL,
      category_uuid TEXT,
      created_at TEXT NOT NULL,
      updated_at TEXT NOT NULL,
      FOREIGN KEY (category_uuid) REFERENCES category(uuid) ON DELETE SET NULL
    );
  ''';
}
