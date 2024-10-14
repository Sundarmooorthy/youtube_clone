import 'package:flutter/material.dart';
import 'package:youtube_clone/my_app_exports.dart';

class CommonIconButton extends StatelessWidget {
  final Function()? onTap;
  final IconData? icon;
  final Color? color;
  final double? size;
  final bool isLabel;
  final String? label;

  const CommonIconButton({
    super.key,
    this.onTap,
    this.icon = Icons.circle,
    this.color = Colors.white,
    this.size = 24,
    this.isLabel = false,
    this.label = 'Label',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onTap,
          icon: Icon(
            icon,
            size: size,
            color: color,
          ),
        ),
      isLabel?  Text(
          label!,
          style: const TextStyle(color: AppColors.white),
        ):const SizedBox.shrink(),
      ],
    );
  }
}
