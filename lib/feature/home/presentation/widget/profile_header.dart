import 'package:flutter/material.dart';
import 'package:wizh/core/theme/app_color.dart';
import 'package:wizh/core/theme/app_spacing.dart';

/// The header section containing user profile information and notification icon.
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.m,
        vertical: AppSpacing.xs,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundImage: AssetImage("assets/profile_1.jpeg"),
          ),
          AppSpacing.mHorizontal,
          UserGreeting(),
          Spacer(),
          Icon(
            Icons.notifications_none_rounded,
            size: 24,
            color: AppColor.blackGrey,
          ),
        ],
      ),
    );
  }
}

/// Displays the user's name and a greeting message.
class UserGreeting extends StatelessWidget {
  const UserGreeting({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "William",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColor.blackGrey,
              ),
        ),
        AppSpacing.sVertical,
        Text(
          "Where do you want to go?",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColor.blackGrey,
              ),
        ),
      ],
    );
  }
}