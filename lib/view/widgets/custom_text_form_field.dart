import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String hintText;
  final Color hintStyleColor;
  final double fontSize;
  final Function onSave;
  final  Function onValidator;
  final bool secure;
  final TextEditingController controller;
  const CustomTextFormField(
      {Key key,
      this.title,
      this.hintText,
      this.hintStyleColor,
      this.fontSize,
      this.onSave,
      this.onValidator ,
      this.secure = false,
      this.controller,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          title: title,
          fontSize: fontSize,
          color: Colors.grey.shade900,
          alignment: Alignment.topLeft,
        ),
        TextFormField(
          controller: controller,
          obscureText: secure,
          onSaved: onSave,
          validator: onValidator,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: hintStyleColor,
              ),
              fillColor: Colors.white),
        )
      ],
    );
  }
}
