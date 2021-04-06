import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  final String text;
  final String imageName;
  final Function onPress;
  final fontSize;
  final borderRadius;
  final width;

  CustomButtonSocial({
    @required this.text,
    @required this.imageName,
    @required this.onPress,
  @required this.fontSize,
  @required this.borderRadius, this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: Colors.grey.shade200,
      ),
      child: FlatButton(
        onPressed: onPress,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(borderRadius),
        ),
        child: Row(
          children: [
            Image.asset(imageName),
            SizedBox(
              width: width,
            ),
            CustomText(
              title: text,
              fontSize: fontSize,
            ),
          ],
        ),
      ),
    );
  }
}