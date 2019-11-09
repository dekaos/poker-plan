import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color;
  final String imageUrl;

  Button({Key key, this.text = '', @required this.onPressed, this.color = Colors.blue, this.imageUrl = ''});

  @override
  Widget build(BuildContext context) {

    final double screenWidth = MediaQuery.of(context).size.width;
    final hasImage = imageUrl.length > 0 ? true : false;
    final hasText = text.length > 0 ? true : false;

    return Container(
      width: screenWidth / 4,
      height: screenWidth / 4,
      margin: EdgeInsets.all(screenWidth / 40),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
        ),
        color: color,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              hasText ? Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: screenWidth / 12),
              ): Container(),
              hasImage ? Center(child: Image(image: AssetImage(imageUrl))) : Center(),
            ],
          )
        ),
        onPressed: onPressed,
      )
    );
  }
}
