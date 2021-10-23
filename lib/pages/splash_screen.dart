import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nextpage/pages/home_page.dart';
import 'package:nextpage/provider/timer_info.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (t) async {
      var timerInfo = Provider.of<TimerInfo>(context, listen: false);
      try {
        if (timerInfo.getRemainingTime() != 0) {
          await timerInfo.updateRemainingTime();
        } else {
          setState(() {
            timerInfo.dispose();
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ));
          });
        }
      } catch (e) {
        print(e);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(Icons.timer, size: MediaQuery.of(context).size.width / 2),
            SizedBox(height: 32),
            Consumer<TimerInfo>(
              builder: (context, data, child) {
                return Text(data.getRemainingTime()?.toString() ?? '',
                    style: TextStyle(fontSize: 72));
              },
            ),
          ],
        ),
      ),
    );
  }
}
