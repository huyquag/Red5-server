import 'package:floor/floor.dart';

@Entity(tableName: 'Customers', indices: [
  Index(value: ['phone_number'])
])
class Customers {
  @PrimaryKey(autoGenerate: true)
  final int id;

  @ColumnInfo(name: 'name', nullable: false)
  final String name;

  @ColumnInfo(name: 'phone_number', nullable: false)
  final int phone;

  @ColumnInfo(name: 'address', nullable: true)
  final String address;

  Customers({this.id, this.name, this.phone, this.address});
}
