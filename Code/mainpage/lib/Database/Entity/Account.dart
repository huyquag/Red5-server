import 'package:floor/floor.dart';

@Entity(tableName: 'Account', indices: [
  Index(value: ['phone_number'])
])
class Account {
  @PrimaryKey(autoGenerate: true)
  final int code;

  @ColumnInfo(name: 'user name', nullable: false)
  final String username;

  @ColumnInfo(name: 'password', nullable: false)
  final String password;

  @ColumnInfo(name: 'phone_number', nullable: false)
  final int phone;

  @ColumnInfo(name: 'name', nullable: false)
  final String name;

  @ColumnInfo(name: 'desciption', nullable: true)
  final String desciption;

  Account(
      {this.code,
      this.username,
      this.password,
      this.phone,
      this.name,
      this.desciption});
}
