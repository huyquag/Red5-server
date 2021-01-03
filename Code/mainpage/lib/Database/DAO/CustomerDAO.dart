import 'package:floor/floor.dart';
import 'package:mainpage/Database/Entity/Customers.dart';

@dao
abstract class CustomersDao {
  @Query('SELECT * FROM Customers')
  Future<List<Customers>> findAllCustomers();

  @Query('SELECT * FROM Customers WHERE id = :id')
  Future<Customers> findCustomersById(int id);

  @Query('SELECT * FROM Customers WHERE id = :id AND name = :name')
  Future<Customers> findCustomersByIdAndName(int id, String name);

  @insert
  Future<void> insertCustomers(Customers customers);

  @Query('DELETE FROM Customers')
  Future<void> deleteAllCustomers();
}
