import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mainpage/Database/DAO/StoresDao.dart';
import 'package:mainpage/styles.dart';

import 'Tab/main_page.dart';
import 'Tab/storage.dart';
import 'Tab/my_store.dart';

class CupertinoStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoApp(
      home: CupertinoStoreHomePage(),
    );
  }
}

class CupertinoStoreHomePage extends StatelessWidget {
  @override
  final StoresDao dao;
  CupertinoStoreHomePage({this.dao});

  Widget tab_build() {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.home,
              color: Styles.searchIconColor,
            ),
            title: Text(
              "home",
              style: Styles.deliveryTime,
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.calendar), title: Text("Storage")),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.shopping_cart),
              title: Text("My store")),
        ],
      ),
      tabBuilder: (context, index) {
        CupertinoTabView returnValue;
        switch (index) {
          case 0:
            returnValue = CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: MainPage(),
                );
              },
            );
            break;
          case 1:
            returnValue = CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: Storage(),
                );
              },
            );
            break;
          case 2:
            returnValue = CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: MyStore(),
                );
              },
            );
            break;
        }
        return returnValue;
      },
    );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Name Shop"),
          backgroundColor: Styles.searchIconColor,
          leading: Icon(
            Icons.list,
            size: 30.0,
          ),
        ),
        body: tab_build(),
      ),
    );
  }
}

//CupertinoPageScaffold(
//   navigationBar: CupertinoNavigationBar(
//       middle: Text("Name Store"), backgroundColor: Colors.white),
//   child: CupertinoTabScaffold(
//     tabBar: CupertinoTabBar(
//       items: const <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//           icon: Icon(CupertinoIcons.home),
//           title: Text("Main"),
//         ),
//         BottomNavigationBarItem(
//             icon: Icon(CupertinoIcons.calendar), title: Text('Storage')),
//         BottomNavigationBarItem(
//             icon: Icon(CupertinoIcons.shopping_cart),
//             title: Text('My Store'))
//       ],
//     ),
//     tabBuilder: (context, index) {
//       CupertinoTabView returnValue;
//       switch (index) {
//         case 0:
//           returnValue = CupertinoTabView(
//             builder: (context) {
//               return CupertinoPageScaffold(
//                 child: MainPage(),
//               );
//             },
//           );
//           break;
//         case 1:
//           returnValue = CupertinoTabView(
//             builder: (context) {
//               return CupertinoPageScaffold(
//                 child: Storage(),
//               );
//             },
//           );
//           break;
//         case 2:
//           returnValue = CupertinoTabView(
//             builder: (context) {
//               return CupertinoPageScaffold(
//                 child: MyStore(),
//               );
//             },
//           );
//           break;
//       }
//       return returnValue;
//     },
//   ),
// );
