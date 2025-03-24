import 'package:flutter/material.dart';
import 'package:wizh/core/theme/app_color.dart';
import 'package:wizh/core/theme/app_spacing.dart';
import 'package:wizh/core/widget/section_header.dart';
import 'package:wizh/feature/home/presentation/widget/profile_header.dart';
import 'package:wizh/feature/home/presentation/widget/search_section.dart';
import 'package:wizh/feature/home/presentation/widget/filter_chips_row.dart';
import 'package:wizh/feature/home/presentation/widget/for_you_destination_widget.dart';
import 'package:wizh/feature/home/presentation/widget/popular_destination_widget.dart';

/// The main home screen of the application.
/// Displays user profile, search functionality, destination filters,
/// and lists of popular and recommended destinations.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.backgroundGray,
      body: SafeArea(
        child: HomeContent(),
      ),
    );
  }
}

/// The main content area of the home screen.
/// Contains all the sections of the home screen in a scrollable view.
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: AppSpacing.xxl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileHeader(),
          AppSpacing.mVertical,
          SearchSection(),
          AppSpacing.mVertical,
          FilterChipsRow(),
          AppSpacing.mVertical,
          SectionHeader(
            title: "Popular Destination",
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.m),
          ),
          AppSpacing.mVertical,
          PopularDestinationWidget(),
          AppSpacing.xxlVertical,
          SectionHeader(
            title: "Special For You",
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.m),
            actionText: "Explore All",
            actionStyle: TextStyle(color: AppColor.primaryColor),
          ),
          AppSpacing.mVertical,
          ForYouDestinationWidget(),
        ],
      ),
    );
  }
}