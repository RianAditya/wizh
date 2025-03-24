import 'package:flutter/material.dart';
import 'package:wizh/core/theme/app_color.dart';
import 'package:wizh/core/theme/app_spacing.dart';

/// An individual filter chip button used for selecting destination categories.
class FilterChipButton extends StatelessWidget {
  final String label;

  /// Creates a filter chip button with the given [label].
  const FilterChipButton({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _calculateButtonWidth(context),
      height: 48,
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(AppSpacing.m),
      ),
      child: Center(
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColor.white,
              ),
        ),
      ),
    );
  }

  /// Calculates the width of the filter chip button based on the screen width.
  double _calculateButtonWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return (screenWidth - 2 * AppSpacing.m - 2 * AppSpacing.s) / 3;
  }
}