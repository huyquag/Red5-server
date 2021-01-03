import 'package:floor/floor.dart';
import 'package:mainpage/Database/Entity/Stores.dart';

@dao
abstract class StoresDao {
  @Query('SELECT * FROM Stores')
  Future<List<Stores>> findAllStores();

  @Query('SELECT * FROM Stores WHERE id = :id')
  Future<Stores> findStoresById(int id);

  @Query('SELECT * FROM Stores WHERE id = :id AND name = :name')
  Future<Stores> findStoresByIdAndName(int id, String name);

  @insert
  Future<void> insertStores(Stores stores);

  @Query('DELETE FROM Stores')
  Future<void> deleteAllStores();
}
