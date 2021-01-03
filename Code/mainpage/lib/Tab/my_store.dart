import 'package:flutter/cupertino.dart';

class MyStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text('My Store'),
        )
      ],
    );
  }
}
