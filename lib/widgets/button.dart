import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color;

  Button({Key key, this.text, @required this.onPressed, this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth / 4,
      height: screenWidth / 4,
      margin: EdgeInsets.all(screenWidth / 40),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
        ),
        color: color,
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: screenWidth / 12),
        ),
        onPressed: onPressed,
      )
    );
  }
}
