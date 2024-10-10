import 'package:flutter/material.dart';

class CommonIconButton extends StatelessWidget {
  final Function()? onTap;
  final IconData? icon;
  final Color? color;
  final double? size;

  const CommonIconButton({
    super.key,
    this.onTap,
    this.icon = Icons.circle,
    this.color = Colors.white,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        icon,
        size: size,
        color: color,
      ),
    );
  }
}
