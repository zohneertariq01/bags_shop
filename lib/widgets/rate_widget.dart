import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class RateWidget extends StatefulWidget {

  const RateWidget({super.key});

  @override
  _RateWidgetState createState() => _RateWidgetState();
}

class _RateWidgetState extends State<RateWidget> {

  double value = 0;

  @override
  Widget build(BuildContext context) {
    return RatingStars(
      value: value,
      onValueChanged: (v) {
        setState(() {
          value = v;
        });

      },
      valueLabelVisibility: false,
      starBuilder: (index, color) =>
          Icon(
            Icons.star_rate_rounded,
            color: color,
          ),
      starCount: 5,
      starSize: 20,
      maxValue: 5,
      starSpacing: 2,
      animationDuration: const Duration(milliseconds: 1000),
      starColor: const Color(0xffff9228),
      starOffColor: Colors.white,
    );
  }
}