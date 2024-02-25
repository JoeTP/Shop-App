import 'package:flutter/material.dart';
import 'package:shop_app/config/variables.dart';

class ProductItem extends StatelessWidget {
  ProductItem({
    Key? key,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.button,
    required this.photoUrl,
  }) : super(key: key);
  final String photoUrl;
  final String title;
  final double price;
  final double oldPrice;
  final IconButton button;

  final double _size = p50 * 2.5;
  final double _font = 17;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: _size * 1.5,
        height: _size * 2.4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color(0xFDFFBB5F),
              offset: Offset(1, 1),
              blurRadius: 2,
              spreadRadius: 1,
            )
          ],
        ),
        child: Stack(
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  width: _size * 1.5,
                  height: _size * 1.78,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(photoUrl), fit: BoxFit.cover),
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                ),
                if (price != oldPrice)
                  Container(
                    color: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    child: Text(
                      'DISCOUNT',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 2,
                      color: Colors.black.withOpacity(0.2),
                    ))
              ],
            ),
            Positioned(
              top: _size * 1.8,
              left: 5,
              right: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: _font),
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 5,
                left: 5,
                right: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 15,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Container(
                              alignment: Alignment.bottomLeft,
                              height: 15,
                              child: Text(price.toString() + '\$',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold)),
                            )),
                            SizedBox(width: 5),
                            if (price != oldPrice)
                              Expanded(
                                  child: Container(
                                alignment: Alignment.bottomLeft,
                                height: 15,
                                child: Text(oldPrice.toString() + '\$',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: _font - 5,
                                        decoration:
                                            TextDecoration.lineThrough)),
                              )),
                          ],
                        ),
                      ),
                    ),
                    button
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
