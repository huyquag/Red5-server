import 'package:floor/floor.dart';

@Entity(primaryKeys: ['id', 'name'])
class Stores {
  @PrimaryKey(autoGenerate: true)
  final int id;

  @ColumnInfo(name: 'name', nullable: false)
  final String name;

  @ColumnInfo(name: 'description', nullable: false)
  final String description;

  Stores({this.id, this.name, this.description});
}
