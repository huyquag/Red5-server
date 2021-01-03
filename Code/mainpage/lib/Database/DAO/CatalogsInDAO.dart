import 'package:floor/floor.dart';
import 'package:mainpage/Database/Entity/CatalogsIn.dart';

@dao
abstract class CatalogsInDao {
  @Query('SELECT * FROM CatalogsIn')
  Future<List<CatalogsIn>> findAllCatalogsIn();

  @Query('SELECT * FROM CatalogsIn WHERE id = :id')
  Future<CatalogsIn> findCatalogsInById(int id);

  @insert
  Future<void> insertCatalogsIn(CatalogsIn catalogsIn);

  @Query('DELETE FROM CatalogsIn')
  Future<void> deleteAllCatalogsIn();
}
