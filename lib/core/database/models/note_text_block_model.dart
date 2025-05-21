import 'dart:convert';

class NoteTextBlockModel {
  final String uuid;
  final String noteUuid;
  final int position; // Order within the note
  final String text; // Markdown content
  final Map<String, dynamic>? properties; // Future extensibility
  final String? linkedWhiteboardBlockUuid; // For bidirectional sync

  NoteTextBlockModel({
    required this.uuid,
    required this.noteUuid,
    required this.position,
    required this.text,
    this.properties,
    this.linkedWhiteboardBlockUuid,
  });

  Map<String, dynamic> toMap() => {
    'uuid': uuid,
    'note_uuid': noteUuid,
    'position': position,
    'text': text,
    'properties': properties != null ? jsonEncode(properties) : null,
    'linked_whiteboard_block_uuid': linkedWhiteboardBlockUuid,
  };

  static const String tableName = 'note_text_block';

  static String get createTable => '''
    CREATE TABLE $tableName (
      uuid TEXT PRIMARY KEY,
      note_uuid TEXT NOT NULL,
      position INTEGER NOT NULL,
      text TEXT NOT NULL,
      properties TEXT,
      linked_whiteboard_block_uuid TEXT,
      FOREIGN KEY (note_uuid) REFERENCES note(uuid) ON DELETE CASCADE,
      FOREIGN KEY (linked_whiteboard_block_uuid) REFERENCES whiteboard_block(uuid) ON DELETE SET NULL
    );
  ''';
}
