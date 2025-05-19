import 'package:uuid/uuid.dart';
import 'package:notu/app/entity/note/text_block.dart';
import 'package:notu/app/entity/note/witheboard_block.dart';

class Note {
  final String uuid;
  List<TextBlock> textBlocks;
  WhiteboardBlock whiteboard;
  Note({String? uuid, required this.textBlocks, required this.whiteboard})
    : uuid = uuid ?? Uuid().v4();
}
