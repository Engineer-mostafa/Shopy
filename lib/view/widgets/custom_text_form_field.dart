

import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final title;
  final hintText;
  final hintStyleColor;
  final fontSize;
  final Function onSave;
  final Function onValidator;

  const CustomTextFormField({Key key, this.title, this.hintText, this.hintStyleColor, this.fontSize, this.onSave, this.onValidator}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CustomText(
          title: title,
          fontSize: fontSize,
          color: Colors.grey.shade900,
          alignment: Alignment.topLeft,
        ),
        TextFormField(
          onSaved: onSave,
          validator: onValidator,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: hintStyleColor,

              ),
              fillColor:Colors.white
          ),
        )
      ],
    );
  }
}
