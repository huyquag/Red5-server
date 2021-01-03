import 'package:floor/floor.dart';

@entity
class CatalogsOut {
  @PrimaryKey(autoGenerate: true)
  final int id;

  @ColumnInfo(name: 'description', nullable: false)
  final String description;

  @ColumnInfo(name: 'sale price', nullable: false)
  final String salePrice;

  CatalogsOut({this.id, this.description, this.salePrice});
}
