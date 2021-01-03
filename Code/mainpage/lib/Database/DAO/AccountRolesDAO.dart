import 'package:floor/floor.dart';
import 'package:mainpage/Database/Entity/AccountRoles.dart';

@dao
abstract class AccountRolesDao {
  @Query('SELECT * FROM AccountRoles')
  Future<List<AccountRoles>> findAllAccountRoles();

  @Query('SELECT * FROM AccountRoles WHERE id = :id')
  Future<AccountRoles> findAccountRolesById(int id);

  @insert
  Future<void> insertAccountRoles(AccountRoles accountRoles);

  @Query('DELETE FROM AccountRoles')
  Future<void> deleteAllAccountRoles();
}
