import 'package:flutter/material.dart';
import 'package:wizh/core/theme/app_color.dart';

/// A reusable section header component with a title and optional action text.
class SectionHeader extends StatelessWidget {
  final String title;
  final String? actionText;
  final TextStyle? actionStyle;
  final EdgeInsetsGeometry padding;

  /// Creates a section header with the given [title], optional [actionText],
  /// and custom [actionStyle].
  const SectionHeader({
    super.key,
    required this.title,
    this.actionText,
    this.actionStyle,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColor.blackGrey,
                ),
          ),
          if (actionText != null)
            Text(
              actionText!,
              style: actionStyle ??
                  Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColor.primaryColor,
                      ),
            ),
        ],
      ),
    );
  }
}