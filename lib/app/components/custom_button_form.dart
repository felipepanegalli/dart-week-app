import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dart_week_app/app/utils/theme_utils.dart';

class CustomButtonForm extends RawMaterialButton {
  CustomButtonForm({
    @required VoidCallback onPressed,
    @required String label,
    Color primaryColor,
    Color highlightColor,
  }) : super(
          onPressed: onPressed,
          child: Container(
            padding: EdgeInsets.all(10),
            height: Platform.isIOS ? 60 : 50,
            alignment: Alignment.center,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          fillColor: primaryColor ?? ThemeUtils.primaryColor,
          highlightColor: highlightColor ?? ThemeUtils.primaryColor,
        );
}
