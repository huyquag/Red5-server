import 'package:floor/floor.dart';
import 'package:mainpage/Database/Entity/CatalogsOut.dart';

@dao
abstract class CatalogsOutDao {
  @Query('SELECT * FROM CatalogsOut')
  Future<List<CatalogsOut>> findAllCatalogsOut();

  @Query('SELECT * FROM CatalogsOut WHERE id = :id')
  Future<CatalogsOut> findCatalogsOutById(int id);

  @insert
  Future<void> insertCatalogsOut(CatalogsOut catalogsOut);

  @Query('DELETE FROM CatalogsOut')
  Future<void> deleteAllCatalogsOut();
}
