import 'package:flutter/material.dart';
import 'package:wizh/core/theme/app_spacing.dart';
import 'package:wizh/core/theme/app_textsyle.dart';
import 'package:wizh/feature/detail_destination/presentation/widget/rounded_icon_button.dart';

class TopNavDetail extends StatelessWidget {
  const TopNavDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.m,
        AppSpacing.xxl,
        AppSpacing.m,
        AppSpacing.s,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RoundedIconButton(
            icon: Icons.arrow_back,
            onPressed: () => Navigator.pop(context),
          ),
          Text(
            "Detail",
            style: AppTextStyle.instance.titleMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          RoundedIconButton(
            icon: Icons.more_horiz,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}