import 'package:flutter/material.dart';

import '../my_app_exports.dart';

class SuggestionCard extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final Color? bgColor;
  final Function()? onTap;

  const SuggestionCard({
    super.key,
    this.text = 'text',
    this.textColor = Colors.black,
    this.bgColor = Colors.white,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: AppDimens.appVPadding10,
          horizontal: AppDimens.appHPadding10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.appRadius10),
        color: bgColor,
      ),
      child: Text(
        text!,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
