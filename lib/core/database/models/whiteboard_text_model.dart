import 'dart:convert';

class WhiteboardTextModel {
  final String uuid;
  final String whiteboardBlockUuid; // FK to WhiteboardBlockModel
  final String text;
  final Map<String, dynamic>? properties;

  WhiteboardTextModel({
    required this.uuid,
    required this.whiteboardBlockUuid,
    required this.text,
    this.properties,
  });

  Map<String, dynamic> toMap() => {
    'uuid': uuid,
    'whiteboard_block_uuid': whiteboardBlockUuid,
    'text': text,
    'properties': properties != null ? jsonEncode(properties) : null,
  };

  static const String tableName = 'whiteboard_text';

  static String get createTable => '''
    CREATE TABLE $tableName (
      uuid TEXT PRIMARY KEY,
      whiteboard_block_uuid TEXT NOT NULL,
      text TEXT NOT NULL,
      properties TEXT,
      FOREIGN KEY (whiteboard_block_uuid) REFERENCES whiteboard_block(uuid) ON DELETE CASCADE
    );
  ''';
}
