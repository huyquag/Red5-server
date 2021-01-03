import 'package:flutter/cupertino.dart';

class Storage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text('Storage'),
        )
      ],
    );
  }
}
