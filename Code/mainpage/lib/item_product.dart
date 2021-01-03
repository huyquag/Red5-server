import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'styles.dart';

class ProductRowItem extends StatelessWidget {
  @override
  const ProductRowItem(this.indext);
  final int indext;

  Widget screenMoreInfo(indext) {
    final screen = ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Container(
        height: 750,
        alignment: Alignment.center,
        color: Color(0x2FFFFBBB),
        child: Text('Test $indext'),
      ),
    );
    return screen;
  }

  Widget build(BuildContext context) {
    final row = GestureDetector(
      onDoubleTap: () => {
        showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) {
              return CupertinoPopupSurface(
                child: screenMoreInfo(indext),
              );
            })
      },
      onTap: () => {print('Choose item $indext')},
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              color: Colors.amber,
              child: Column(
                children: [
                  Text(
                    'Test',
                    style: Styles.productRowItemName,
                  ),
                  Text(
                    'Test',
                    style: Styles.productRowItemPrice,
                  ),
                  Text(
                    'Index $indext',
                    style: Styles.productRowItemPrice,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
    return row;
  }
}
