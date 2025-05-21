import 'dart:convert';

class WhiteboardBlockModel {
  final String uuid;
  final String noteUuid;
  final String type; // 'text', 'rectangle', 'circle', 'drawing', etc.
  final double x;
  final double y;
  final double width;
  final double height;
  final String? color;
  final int zIndex;
  final Map<String, dynamic>?
  properties; // For future properties (drawing points, etc.)
  final String? linkedTextBlockUuid; // For synced text blocks

  WhiteboardBlockModel({
    required this.uuid,
    required this.noteUuid,
    required this.type,
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    this.color,
    required this.zIndex,
    this.properties,
    this.linkedTextBlockUuid,
  });

  Map<String, dynamic> toMap() => {
    'uuid': uuid,
    'note_uuid': noteUuid,
    'type': type,
    'x': x,
    'y': y,
    'width': width,
    'height': height,
    'color': color,
    'z_index': zIndex,
    'properties': properties != null ? jsonEncode(properties) : null,
    'linked_text_block_uuid': linkedTextBlockUuid,
  };

  static const String tableName = 'whiteboard_block';

  static String get createTable => '''
    CREATE TABLE $tableName (
      uuid TEXT PRIMARY KEY,
      note_uuid TEXT NOT NULL,
      type TEXT NOT NULL,
      x REAL NOT NULL,
      y REAL NOT NULL,
      width REAL NOT NULL,
      height REAL NOT NULL,
      color TEXT,
      z_index INTEGER NOT NULL,
      properties TEXT,
      linked_text_block_uuid TEXT,
      FOREIGN KEY (note_uuid) REFERENCES note(uuid) ON DELETE CASCADE,
      FOREIGN KEY (linked_text_block_uuid) REFERENCES note_text_block(uuid) ON DELETE SET NULL
    );
  ''';
}
