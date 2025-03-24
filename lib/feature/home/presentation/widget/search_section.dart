import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wizh/core/theme/app_color.dart';
import 'package:wizh/core/theme/app_spacing.dart';
import 'package:wizh/core/theme/app_textsyle.dart'; // Import AppTextStyle

/// A search bar section allowing users to search for destinations.
class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.m,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: AppColor.backgroundWhite,
        borderRadius: BorderRadius.circular(AppSpacing.m),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l),
        child: Row(
          children: [
            const Icon(
              CupertinoIcons.search,
              color: AppColor.blackGrey,
            ),
            const SizedBox(width: AppSpacing.s), // Use AppSpacing.s for spacing
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search any location, bali, rome, etc.",
                  hintStyle: AppTextStyle.instance.bodySmall.copyWith(
                        color: AppColor.blackGrey,
                      ),
                  border: InputBorder.none, // Remove the default underline
                ),
                style: AppTextStyle.instance.bodySmall.copyWith(
                      color: AppColor.blackGrey,
                    ),
                onChanged: (value) {
                  // Handle search input changes here
                  print("Search query: $value");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}