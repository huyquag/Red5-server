import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mainpage/Database/DAO/StoresDao.dart';
import 'package:mainpage/Database/Entity/Stores.dart';
import 'package:mainpage/Database/database.dart';
import '../item_product.dart';
import '../styles.dart';

class MainPage extends StatefulWidget {
  @override
  StateMainPage createState() {
    // TODO: implement createState
    return StateMainPage();
  }
}

class StateMainPage extends State<MainPage> {
  StoresDao database;
  StateMainPage({this.database});
  @override
  int _idProduct = 0;
  // TODO: implement build
  Widget item(int indext) {
    return ProductRowItem(indext);
  }

  void _count() {
    setState(() async {
      _idProduct = _idProduct + 1;
      final store =
          Stores(id: _idProduct, name: 'Test $_idProduct', description: 'Test');
      await database.insertStores(store);
      // print(database.findAllStores());
    });
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        CustomScrollView(
          slivers: <Widget>[
            // CupertinoSliverNavigationBar(
            //   largeTitle: Text('Home'),
            // ),
            SliverSafeArea(
              top: false,
              minimum: EdgeInsets.only(top: 8.0),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0.0,
                  crossAxisSpacing: 0.0,
                ),
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int indext) {
                  return item(indext);
                }, childCount: _idProduct),
              ),
            )
          ],
        ),
        Container(
          padding: EdgeInsets.only(bottom: 100.0, right: 20.0),
          alignment: Alignment.bottomRight,
          child: MaterialButton(
            child: Icon(
              Icons.add_circle,
              size: 65.0,
              color: Styles.searchIconColor,
            ),
            onPressed: _count,
          ),
        ),
      ],
    );
  }
}
