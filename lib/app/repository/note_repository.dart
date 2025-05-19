import 'package:notu/app/entity/note/note.dart';

class NotesRepository {
  static final NotesRepository _instance = NotesRepository._internal();
  factory NotesRepository() => _instance;
  NotesRepository._internal();

  final List<Note> _notes = [];

  List<Note> get notes => _notes;
}
