import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final VoidCallback? onPressed;

  const CustomElevatedButton({
    super.key,
    required this.text,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Colors.black,
        // Default background color
        foregroundColor: foregroundColor ?? Colors.white,
        // Default text color
        shape: StadiumBorder(
          side: BorderSide(
            color: borderColor ?? Colors.transparent, // Default border color
          ),
        ),
        padding: const EdgeInsets.symmetric(
            horizontal: 20, vertical: 12), // Adjust padding as needed
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
