import 'dart:io';

import 'package:flutter/material.dart';

class CustomTextFormField extends TextFormField {
  CustomTextFormField({
    ValueChanged<String> onChanged,
    FormFieldValidator<String> validator,
    @required String label,
    bool obscureText,
    double borderRadius,
    double fontSize,
    EdgeInsets padding,
    TextEditingController controller,
    IconData icon,
  }) : super(
          controller: controller,
          onChanged: onChanged,
          validator: validator,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            suffixIcon: icon != null ? Icon(icon) : null,
            contentPadding: padding ?? Platform.isIOS
                ? EdgeInsets.only(left: 30, top: 20, bottom: 20)
                : EdgeInsets.only(left: 15, top: 10, bottom: 10),
            labelText: label,
            labelStyle:
                TextStyle(fontSize: fontSize ?? Platform.isIOS ? 20 : 16),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    borderRadius ?? Platform.isIOS ? 30 : 20)),
          ),
        );
}
