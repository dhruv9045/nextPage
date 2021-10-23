import 'package:flutter/material.dart';
import 'package:nextpage/assets/constraints.dart';
import 'package:nextpage/components/book_button.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sCartTitle),
      ),
      body: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
                contentPadding: EdgeInsets.all(18.0),
                leading: Text('Date'),
                title: Text('Time'),
                subtitle: Text('Seats'),
                trailing: Button(colour: secondaryColor, text: sCancel)),
          ],
        ),
      ),
    );
  }
}
