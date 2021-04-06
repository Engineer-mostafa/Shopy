import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final title;
  final color;
  final fontSize;
  final Alignment alignment;

  const CustomText({Key key, this.title:"", this.color:Colors.black, this.fontSize:30.0, this.alignment:Alignment.center})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        title,
        style: TextStyle(color: color, fontSize: fontSize),
      ),
    );
  }
}
