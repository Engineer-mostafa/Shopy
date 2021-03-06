
//Packages
import 'package:flutter/material.dart';


//widgets
import './custom_text.dart';

class CustomButton extends StatelessWidget {
  final double padding;
  final String title;
  final double borderRadius;
  final Color buttonColor;
  final double fontSize;
  final Function onpressed;

  const CustomButton({Key key, this.padding = 10.0, this.borderRadius = 4.0, this.buttonColor = Colors.amber, this.fontSize = 18.0, @required this.onpressed , this.title = "Sign In"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(padding),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius)
      ),
      onPressed: onpressed,
      color: buttonColor,
      child: CustomText(fontSize: fontSize,
        color: Colors.white,
        title: title,
      ),
    );
  }
}
