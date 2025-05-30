import 'package:flutter/material.dart';

abstract class AppDecorations {
  static Decoration greyBoxDecoration = const ShapeDecoration(
    color: Color(0x7FF2F3F3),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
  );
}
