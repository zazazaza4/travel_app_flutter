import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  final FontWeight fontWeight;

  const AppLargeText(
      {super.key,
      this.size = 30,
      required this.text,
      this.fontWeight = FontWeight.bold,
      this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size.toDouble(),
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
