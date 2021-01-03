import 'package:floor/floor.dart';

import 'Account.dart';
import 'Roles.dart';

@Entity(
  tableName: 'AccountRoles',
  foreignKeys: [
    ForeignKey(
      childColumns: ['rolesCode'],
      parentColumns: ['code'],
      entity: Roles,
    ),
    ForeignKey(
      childColumns: ['accountsCode'],
      parentColumns: ['code'],
      entity: Account,
    )
  ],
)
class AccountRoles {
  @PrimaryKey(autoGenerate: true)
  final int accountsCode;

  @ColumnInfo(name: 'rolesCode', nullable: false)
  final String rolesCode;

  AccountRoles({this.accountsCode, this.rolesCode});
}
