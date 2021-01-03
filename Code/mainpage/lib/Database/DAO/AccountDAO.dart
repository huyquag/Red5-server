import 'package:floor/floor.dart';
import 'package:mainpage/Database/Entity/Account.dart';

@dao
abstract class AccountDao {
  @Query('SELECT * FROM Account')
  Future<List<Account>> findAllAccount();

  @Query('SELECT * FROM Account WHERE id = :id')
  Future<Account> findAccountById(int id);

  @Query('SELECT * FROM Account WHERE id = :id AND name = :name')
  Future<Account> findAccountByIdAndName(int id, String name);

  @insert
  Future<void> insertAccount(Account account);

  @Query('DELETE FROM Account')
  Future<void> deleteAllAccount();
}
