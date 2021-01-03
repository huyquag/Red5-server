import 'package:floor/floor.dart';

@entity
class Roles {
  @PrimaryKey(autoGenerate: true)
  final int code;

  @ColumnInfo(name: 'description', nullable: false)
  final String description;

  Roles({this.code, this.description});
}
