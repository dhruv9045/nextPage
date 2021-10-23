import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:nextpage/assets/constraints.dart';
import 'package:nextpage/components/book_button.dart';
import 'package:nextpage/components/cart_icon.dart';
import 'package:nextpage/model/class_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Box<String> cartBox;

  Future<List<BookClass>> readJsonData() async {
    final jsonData =
        await rootBundle.loadString('assets/load_json/book-class.json');
    final list = json.decode(jsonData) as List<dynamic>;
    return list.map((e) => BookClass.fromJson(e)).toList();
  }

  @override
  void initState() {
    cartBox = Hive.box<String>("cart");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Time Left:' + ' 60 ' + 'seconds', style: leftTime),
              Text(sHomeTitle, style: claimTitle),
            ],
          ),
          actions: <Widget>[
            CartIcon(cartBox: cartBox),
          ],
        ),
        body: Container(
          child: FutureBuilder(
            future: readJsonData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error'),
                );
              } else if (snapshot.hasData) {
                var myData = snapshot.data as List<BookClass>;
                return ListView.builder(
                    itemCount: myData == null ? '' : myData.length,
                    itemBuilder: (context, index) {
                      int available = int.parse(myData[index].availability);
                      return Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              contentPadding: EdgeInsets.all(18.0),
                              leading: Text(myData[index].date),
                              title: Text(myData[index].time),
                              subtitle: Text('$available' +
                                  ' seats available'),
                              trailing: available != 0
                                  ? Button(colour: primaryColor, text: sBook, )
                                  : Button(colour: secondaryColor, text: sFull),
                            ),
                          ],
                        ),
                      );
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ));
  }
}
