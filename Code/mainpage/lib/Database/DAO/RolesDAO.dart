import 'package:floor/floor.dart';
import 'package:mainpage/Database/Entity/Roles.dart';

@dao
abstract class RolesDao {
  @Query('SELECT * FROM Roles')
  Future<List<Roles>> findAllRoles();

  @Query('SELECT * FROM Roles WHERE id = :id')
  Future<Roles> findRolesById(int id);

  @insert
  Future<void> insertAccountRoles(Roles roles);

  @Query('DELETE FROM Roles')
  Future<void> deleteAllRoles();
}
