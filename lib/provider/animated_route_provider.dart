import 'package:flutter/material.dart';

Route createRoute(Widget destinationWidget) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => destinationWidget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}