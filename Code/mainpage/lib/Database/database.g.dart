// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  StoresDao _storesDaoInstance;

  AccountDao _accountDaoInstance;

  AccountRolesDao _accountRolesDaoInstance;

  CatalogsInDao _catalogsInDaoInstance;

  CatalogsOutDao _catalogsOutDaoInstance;

  CustomersDao _customersDaoInstance;

  RolesDao _rolesDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Stores` (`id` INTEGER, `name` TEXT NOT NULL, `description` TEXT NOT NULL, PRIMARY KEY (`id`, `name`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Account` (`code` INTEGER PRIMARY KEY AUTOINCREMENT, `user name` TEXT NOT NULL, `password` TEXT NOT NULL, `phone_number` INTEGER NOT NULL, `name` TEXT NOT NULL, `desciption` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `AccountRoles` (`accountsCode` INTEGER PRIMARY KEY AUTOINCREMENT, `rolesCode` TEXT NOT NULL, FOREIGN KEY (`rolesCode`) REFERENCES `Roles` (`code`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`accountsCode`) REFERENCES `Account` (`code`) ON UPDATE NO ACTION ON DELETE NO ACTION)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `CatalogsIn` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `description` TEXT NOT NULL, `sale price` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `CatalogsOut` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `description` TEXT NOT NULL, `sale price` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Customers` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `phone_number` INTEGER NOT NULL, `address` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Roles` (`code` INTEGER PRIMARY KEY AUTOINCREMENT, `description` TEXT NOT NULL)');
        await database.execute(
            'CREATE INDEX `index_Account_phone_number` ON `Account` (`phone_number`)');
        await database.execute(
            'CREATE INDEX `index_Customers_phone_number` ON `Customers` (`phone_number`)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  StoresDao get storesDao {
    return _storesDaoInstance ??= _$StoresDao(database, changeListener);
  }

  @override
  AccountDao get accountDao {
    return _accountDaoInstance ??= _$AccountDao(database, changeListener);
  }

  @override
  AccountRolesDao get accountRolesDao {
    return _accountRolesDaoInstance ??=
        _$AccountRolesDao(database, changeListener);
  }

  @override
  CatalogsInDao get catalogsInDao {
    return _catalogsInDaoInstance ??= _$CatalogsInDao(database, changeListener);
  }

  @override
  CatalogsOutDao get catalogsOutDao {
    return _catalogsOutDaoInstance ??=
        _$CatalogsOutDao(database, changeListener);
  }

  @override
  CustomersDao get customersDao {
    return _customersDaoInstance ??= _$CustomersDao(database, changeListener);
  }

  @override
  RolesDao get rolesDao {
    return _rolesDaoInstance ??= _$RolesDao(database, changeListener);
  }
}

class _$StoresDao extends StoresDao {
  _$StoresDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _storesInsertionAdapter = InsertionAdapter(
            database,
            'Stores',
            (Stores item) => <String, dynamic>{
                  'id': item.id,
                  'name': item.name,
                  'description': item.description
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Stores> _storesInsertionAdapter;

  @override
  Future<List<Stores>> findAllStores() async {
    return _queryAdapter.queryList('SELECT * FROM Stores',
        mapper: (Map<String, dynamic> row) => Stores(
            id: row['id'] as int,
            name: row['name'] as String,
            description: row['description'] as String));
  }

  @override
  Future<Stores> findStoresById(int id) async {
    return _queryAdapter.query('SELECT * FROM Stores WHERE id = ?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) => Stores(
            id: row['id'] as int,
            name: row['name'] as String,
            description: row['description'] as String));
  }

  @override
  Future<Stores> findStoresByIdAndName(int id, String name) async {
    return _queryAdapter.query('SELECT * FROM Stores WHERE id = ? AND name = ?',
        arguments: <dynamic>[id, name],
        mapper: (Map<String, dynamic> row) => Stores(
            id: row['id'] as int,
            name: row['name'] as String,
            description: row['description'] as String));
  }

  @override
  Future<void> deleteAllStores() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Stores');
  }

  @override
  Future<void> insertStores(Stores stores) async {
    await _storesInsertionAdapter.insert(stores, OnConflictStrategy.abort);
  }
}

class _$AccountDao extends AccountDao {
  _$AccountDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _accountInsertionAdapter = InsertionAdapter(
            database,
            'Account',
            (Account item) => <String, dynamic>{
                  'code': item.code,
                  'user name': item.username,
                  'password': item.password,
                  'phone_number': item.phone,
                  'name': item.name,
                  'desciption': item.desciption
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Account> _accountInsertionAdapter;

  @override
  Future<List<Account>> findAllAccount() async {
    return _queryAdapter.queryList('SELECT * FROM Account',
        mapper: (Map<String, dynamic> row) => Account(
            code: row['code'] as int,
            username: row['user name'] as String,
            password: row['password'] as String,
            phone: row['phone_number'] as int,
            name: row['name'] as String,
            desciption: row['desciption'] as String));
  }

  @override
  Future<Account> findAccountById(int id) async {
    return _queryAdapter.query('SELECT * FROM Account WHERE id = ?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) => Account(
            code: row['code'] as int,
            username: row['user name'] as String,
            password: row['password'] as String,
            phone: row['phone_number'] as int,
            name: row['name'] as String,
            desciption: row['desciption'] as String));
  }

  @override
  Future<Account> findAccountByIdAndName(int id, String name) async {
    return _queryAdapter.query(
        'SELECT * FROM Account WHERE id = ? AND name = ?',
        arguments: <dynamic>[id, name],
        mapper: (Map<String, dynamic> row) => Account(
            code: row['code'] as int,
            username: row['user name'] as String,
            password: row['password'] as String,
            phone: row['phone_number'] as int,
            name: row['name'] as String,
            desciption: row['desciption'] as String));
  }

  @override
  Future<void> deleteAllAccount() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Account');
  }

  @override
  Future<void> insertAccount(Account account) async {
    await _accountInsertionAdapter.insert(account, OnConflictStrategy.abort);
  }
}

class _$AccountRolesDao extends AccountRolesDao {
  _$AccountRolesDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _accountRolesInsertionAdapter = InsertionAdapter(
            database,
            'AccountRoles',
            (AccountRoles item) => <String, dynamic>{
                  'accountsCode': item.accountsCode,
                  'rolesCode': item.rolesCode
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<AccountRoles> _accountRolesInsertionAdapter;

  @override
  Future<List<AccountRoles>> findAllAccountRoles() async {
    return _queryAdapter.queryList('SELECT * FROM AccountRoles',
        mapper: (Map<String, dynamic> row) => AccountRoles(
            accountsCode: row['accountsCode'] as int,
            rolesCode: row['rolesCode'] as String));
  }

  @override
  Future<AccountRoles> findAccountRolesById(int id) async {
    return _queryAdapter.query('SELECT * FROM AccountRoles WHERE id = ?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) => AccountRoles(
            accountsCode: row['accountsCode'] as int,
            rolesCode: row['rolesCode'] as String));
  }

  @override
  Future<void> deleteAllAccountRoles() async {
    await _queryAdapter.queryNoReturn('DELETE FROM AccountRoles');
  }

  @override
  Future<void> insertAccountRoles(AccountRoles accountRoles) async {
    await _accountRolesInsertionAdapter.insert(
        accountRoles, OnConflictStrategy.abort);
  }
}

class _$CatalogsInDao extends CatalogsInDao {
  _$CatalogsInDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _catalogsInInsertionAdapter = InsertionAdapter(
            database,
            'CatalogsIn',
            (CatalogsIn item) => <String, dynamic>{
                  'id': item.id,
                  'description': item.description,
                  'sale price': item.salePrice
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CatalogsIn> _catalogsInInsertionAdapter;

  @override
  Future<List<CatalogsIn>> findAllCatalogsIn() async {
    return _queryAdapter.queryList('SELECT * FROM CatalogsIn',
        mapper: (Map<String, dynamic> row) => CatalogsIn(
            id: row['id'] as int,
            description: row['description'] as String,
            salePrice: row['sale price'] as String));
  }

  @override
  Future<CatalogsIn> findCatalogsInById(int id) async {
    return _queryAdapter.query('SELECT * FROM CatalogsIn WHERE id = ?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) => CatalogsIn(
            id: row['id'] as int,
            description: row['description'] as String,
            salePrice: row['sale price'] as String));
  }

  @override
  Future<void> deleteAllCatalogsIn() async {
    await _queryAdapter.queryNoReturn('DELETE FROM CatalogsIn');
  }

  @override
  Future<void> insertCatalogsIn(CatalogsIn catalogsIn) async {
    await _catalogsInInsertionAdapter.insert(
        catalogsIn, OnConflictStrategy.abort);
  }
}

class _$CatalogsOutDao extends CatalogsOutDao {
  _$CatalogsOutDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _catalogsOutInsertionAdapter = InsertionAdapter(
            database,
            'CatalogsOut',
            (CatalogsOut item) => <String, dynamic>{
                  'id': item.id,
                  'description': item.description,
                  'sale price': item.salePrice
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CatalogsOut> _catalogsOutInsertionAdapter;

  @override
  Future<List<CatalogsOut>> findAllCatalogsOut() async {
    return _queryAdapter.queryList('SELECT * FROM CatalogsOut',
        mapper: (Map<String, dynamic> row) => CatalogsOut(
            id: row['id'] as int,
            description: row['description'] as String,
            salePrice: row['sale price'] as String));
  }

  @override
  Future<CatalogsOut> findCatalogsOutById(int id) async {
    return _queryAdapter.query('SELECT * FROM CatalogsOut WHERE id = ?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) => CatalogsOut(
            id: row['id'] as int,
            description: row['description'] as String,
            salePrice: row['sale price'] as String));
  }

  @override
  Future<void> deleteAllCatalogsOut() async {
    await _queryAdapter.queryNoReturn('DELETE FROM CatalogsOut');
  }

  @override
  Future<void> insertCatalogsOut(CatalogsOut catalogsOut) async {
    await _catalogsOutInsertionAdapter.insert(
        catalogsOut, OnConflictStrategy.abort);
  }
}

class _$CustomersDao extends CustomersDao {
  _$CustomersDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _customersInsertionAdapter = InsertionAdapter(
            database,
            'Customers',
            (Customers item) => <String, dynamic>{
                  'id': item.id,
                  'name': item.name,
                  'phone_number': item.phone,
                  'address': item.address
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Customers> _customersInsertionAdapter;

  @override
  Future<List<Customers>> findAllCustomers() async {
    return _queryAdapter.queryList('SELECT * FROM Customers',
        mapper: (Map<String, dynamic> row) => Customers(
            id: row['id'] as int,
            name: row['name'] as String,
            phone: row['phone_number'] as int,
            address: row['address'] as String));
  }

  @override
  Future<Customers> findCustomersById(int id) async {
    return _queryAdapter.query('SELECT * FROM Customers WHERE id = ?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) => Customers(
            id: row['id'] as int,
            name: row['name'] as String,
            phone: row['phone_number'] as int,
            address: row['address'] as String));
  }

  @override
  Future<Customers> findCustomersByIdAndName(int id, String name) async {
    return _queryAdapter.query(
        'SELECT * FROM Customers WHERE id = ? AND name = ?',
        arguments: <dynamic>[id, name],
        mapper: (Map<String, dynamic> row) => Customers(
            id: row['id'] as int,
            name: row['name'] as String,
            phone: row['phone_number'] as int,
            address: row['address'] as String));
  }

  @override
  Future<void> deleteAllCustomers() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Customers');
  }

  @override
  Future<void> insertCustomers(Customers customers) async {
    await _customersInsertionAdapter.insert(
        customers, OnConflictStrategy.abort);
  }
}

class _$RolesDao extends RolesDao {
  _$RolesDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _rolesInsertionAdapter = InsertionAdapter(
            database,
            'Roles',
            (Roles item) => <String, dynamic>{
                  'code': item.code,
                  'description': item.description
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Roles> _rolesInsertionAdapter;

  @override
  Future<List<Roles>> findAllRoles() async {
    return _queryAdapter.queryList('SELECT * FROM Roles',
        mapper: (Map<String, dynamic> row) => Roles(
            code: row['code'] as int,
            description: row['description'] as String));
  }

  @override
  Future<Roles> findRolesById(int id) async {
    return _queryAdapter.query('SELECT * FROM Roles WHERE id = ?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) => Roles(
            code: row['code'] as int,
            description: row['description'] as String));
  }

  @override
  Future<void> deleteAllRoles() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Roles');
  }

  @override
  Future<void> insertAccountRoles(Roles roles) async {
    await _rolesInsertionAdapter.insert(roles, OnConflictStrategy.abort);
  }
}
