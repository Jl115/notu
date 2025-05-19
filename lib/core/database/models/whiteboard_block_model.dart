class WhiteboardBlockModel {
  final String uuid;
  final String noteUuid;

  WhiteboardBlockModel({required this.uuid, required this.noteUuid});

  Map<String, dynamic> toMap() => {'uuid': uuid, 'note_uuid': noteUuid};

  static const String tableName = 'whiteboard_block';

  static String get createTable => '''
  CREATE TABLE $tableName (
    uuid TEXT PRIMARY KEY,
    note_uuid TEXT NOT NULL UNIQUE,
    FOREIGN KEY (note_uuid) REFERENCES note (uuid) ON DELETE CASCADE
  )
''';
}
