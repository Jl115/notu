class WhiteboardTextBlockModel {
  final String uuid;
  final String noteUuid; // Reference to the parent note
  final String textBlockUuid; // Reference to TextBlockModel
  final double posX; // Position on the whiteboard (example)
  final double posY; // Position on the whiteboard (example)
  // Add more fields for size, rotation, etc. as needed

  WhiteboardTextBlockModel({
    required this.uuid,
    required this.noteUuid,
    required this.textBlockUuid,
    required this.posX,
    required this.posY,
    // add more
  });

  Map<String, dynamic> toMap() => {
    'uuid': uuid,
    'note_uuid': noteUuid,
    'text_block_uuid': textBlockUuid,
    'pos_x': posX,
    'pos_y': posY,
    // add more
  };

  static const String tableName = 'whiteboard_text_block';

  static String get createTable => '''
  CREATE TABLE $tableName (
    uuid TEXT PRIMARY KEY,
    note_uuid TEXT NOT NULL,
    text_block_uuid TEXT NOT NULL,
    pos_x REAL NOT NULL,
    pos_y REAL NOT NULL,
    FOREIGN KEY (note_uuid) REFERENCES note (uuid) ON DELETE CASCADE,
    FOREIGN KEY (text_block_uuid) REFERENCES text_block (uuid) ON DELETE CASCADE
  )
''';
}
