import 'package:notu/app/entity/note/note.dart';

class Category {
  final String uuid;
  final String name;
  final String? parentUuid;
  final List<Category> subCategories;
  final List<Note> notes;

  Category({
    required this.uuid,
    required this.name,
    this.parentUuid,
    List<Category>? subCategories,
    List<Note>? notes,
  }) : subCategories = subCategories ?? [],
       notes = notes ?? [];
}
