import 'dart:async';
import 'package:floor/floor.dart';
import 'package:mainpage/Database/DAO/AccountDAO.dart';
import 'package:mainpage/Database/DAO/AccountRolesDAO.dart';
import 'package:mainpage/Database/DAO/CatalogsInDAO.dart';
import 'package:mainpage/Database/DAO/CatalogsOutDAO.dart';
import 'package:mainpage/Database/DAO/CustomerDAO.dart';
import 'package:mainpage/Database/DAO/RolesDAO.dart';
import 'package:mainpage/Database/Entity/AccountRoles.dart';
import 'package:mainpage/Database/Entity/CatalogsIn.dart';
import 'package:mainpage/Database/Entity/CatalogsOut.dart';
import 'package:mainpage/Database/Entity/Customers.dart';
import 'package:mainpage/Database/Entity/Roles.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'DAO/StoresDAO.dart';
import 'Entity/Account.dart';
import 'Entity/Stores.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [
  Stores,
  Account,
  AccountRoles,
  CatalogsIn,
  CatalogsOut,
  Customers,
  Roles
])
abstract class AppDatabase extends FloorDatabase {
  StoresDao get storesDao;
  AccountDao get accountDao;
  AccountRolesDao get accountRolesDao;
  CatalogsInDao get catalogsInDao;
  CatalogsOutDao get catalogsOutDao;
  CustomersDao get customersDao;
  RolesDao get rolesDao;
}
