import 'package:flutter/material.dart';
import 'package:iqra_library_app/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backgroundColor,
    required this.text,
    required this.textColor,
    this.borderRadius,
  });

  final String text;

  final Color backgroundColor;
  final Color textColor;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,

        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(18),
        ),
      ),
      child: Text(
        text,
        style: Styles.textStyle20.copyWith(
          color: textColor,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
