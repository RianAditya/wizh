import 'package:flutter/material.dart';
import 'package:wizh/core/theme/app_spacing.dart';
import 'package:wizh/feature/home/presentation/widget/filter_chip_button.dart';

/// A row of filter chips for destination categories.
class FilterChipsRow extends StatelessWidget {
  const FilterChipsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.m),
      child: Row(
        children: [
          FilterChipButton(label: "Days Trip"),
          AppSpacing.sHorizontal,
          FilterChipButton(label: "Group"),
          AppSpacing.sHorizontal,
          FilterChipButton(label: "Personal"),
        ],
      ),
    );
  }
}