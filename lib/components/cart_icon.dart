import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:nextpage/pages/cart_page.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({
    Key key,
    @required this.cartBox,
  }) : super(key: key);

  final Box<String> cartBox;

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(10.0),
      child: new Container(
          height: 150.0,
          width: 30.0,
          child: new GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new Cart()));
            },
            child: new Stack(
              children: <Widget>[
                new IconButton(
                  icon: new Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                  ),
                  onPressed: null,
                ),
                cartBox.length >= 0
                    ? new Positioned(
                        child: new Stack(
                        children: <Widget>[
                          new Icon(Icons.brightness_1,
                              size: 20.0, color: Colors.black),
                          new Positioned(
                              top: 3.0,
                              right: 5.0,
                              child: new Center(
                                child: new Text(
                                  cartBox.length.toString(),
                                  style: new TextStyle(
                                      color: Colors.white,
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              )),
                        ],
                      ))
                    : new Container(),
              ],
            ),
          )),
    );
  }
}
