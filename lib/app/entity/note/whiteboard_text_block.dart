import 'dart:ui';

class WhiteboardTextBlock {
  final String textBlockUuid; // references TextBlock.uuid
  Offset position;
  WhiteboardTextBlock({required this.textBlockUuid, required this.position});
}
