
//Packages
import 'package:flutter/material.dart';


//widgets
import './custom_text.dart';

class CustomButton extends StatelessWidget {
  final padding;
  final borderRadius;
  final buttonColor;
  final fontSize;
  final Function onpressed;

  const CustomButton({Key key, this.padding = 10, this.borderRadius = 4, this.buttonColor = Colors.amber, this.fontSize = 18.0, this.onpressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  FlatButton(
      padding: EdgeInsets.all(padding),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius)
      ),
      onPressed: onpressed,
      color: buttonColor,
      child: CustomText(fontSize: fontSize,
        color: Colors.white,
        alignment: Alignment.center,
        title: "Sign In",
      ),
    );
  }
}
