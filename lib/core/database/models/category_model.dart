class CategoryModel {
  final String uuid;
  final String name;
  final String? parentUuid; // nullable for root folders

  CategoryModel({required this.uuid, required this.name, this.parentUuid});

  Map<String, dynamic> toMap() => {
    'uuid': uuid,
    'name': name,
    'parent_uuid': parentUuid,
  };

  static const String tableName = 'category';

  static String get createTable => '''
    CREATE TABLE $tableName (
      uuid TEXT PRIMARY KEY,
      name TEXT NOT NULL,
      parent_uuid TEXT,
      FOREIGN KEY (parent_uuid) REFERENCES category (uuid) ON DELETE CASCADE
    )
  ''';
}
