import 'package:uuid/uuid.dart';

class TextBlock {
  final String uuid;
  String text;
  TextBlock({String? uuid, required this.text}) : uuid = uuid ?? Uuid().v4();
}
