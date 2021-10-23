import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({@required this.colour, this.text});
  final colour;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: colour,
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        onPressed: () {},
      ),
    );
  }
}
