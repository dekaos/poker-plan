import 'package:flutter/material.dart';
import 'package:poker_plan/utils/slide_transition.dart';

Future push(context, page) {
  return Navigator.push(
      context,
      SlideRightRoute(widget: page)
  );
}