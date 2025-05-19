class TextBlockModel {
  final String uuid;
  final String noteUuid;
  final String text;

  TextBlockModel({
    required this.uuid,
    required this.noteUuid,
    required this.text,
  });

  Map<String, dynamic> toMap() => {
    'uuid': uuid,
    'note_uuid': noteUuid,
    'text': text,
  };

  static const String tableName = 'text_block';

  static String get createTable => '''
  CREATE TABLE $tableName (
    uuid TEXT PRIMARY KEY,
    note_uuid TEXT NOT NULL,
    text TEXT NOT NULL,
    FOREIGN KEY (note_uuid) REFERENCES note (uuid) ON DELETE CASCADE
  )
''';
}
