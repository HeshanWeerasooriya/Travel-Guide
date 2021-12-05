import 'package:flutter/material.dart';
import 'package:flutter_cubit/misc/widgets/app_text.dart';
import '../colors.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final Color bgColor;
  final Color borderColor;
  double size;
  String? text;
  IconData? icon;
  bool? isIcon;

  AppButtons({
    Key? key,
    required this.color,
    required this.bgColor,
    required this.borderColor,
    required this.size,
    this.text,
    this.icon,
    this.isIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(15),
        color: bgColor,
      ),
      child: isIcon == false
          ? Center(
              child: AppText(
                text: text!,
                color: color,
              ),
            )
          : Center(
              child: Icon(
                icon,
                color: color,
              ),
            ),
    );
  }
}
