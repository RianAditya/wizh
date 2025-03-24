import 'package:flutter/material.dart';
import 'package:wizh/core/theme/app_color.dart';

class RoundedIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const RoundedIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColor.white,
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowBlack,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, color: AppColor.black),
        onPressed: onPressed,
        style: IconButton.styleFrom(backgroundColor: Colors.transparent),
      ),
    );
  }
}