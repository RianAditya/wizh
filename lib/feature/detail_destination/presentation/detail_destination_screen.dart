import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:wizh/core/theme/app_color.dart';
import 'package:wizh/core/theme/app_spacing.dart';
import 'package:wizh/core/theme/app_textsyle.dart';
import 'package:wizh/core/widget/section_header.dart';
import 'package:wizh/feature/detail_destination/presentation/widget/destination_card.dart';
import 'package:wizh/feature/detail_destination/presentation/widget/itineraries_tab.dart';
import 'package:wizh/feature/detail_destination/presentation/widget/review_tab.dart';
import 'package:wizh/feature/detail_destination/presentation/widget/terms_card.dart';
import 'package:wizh/feature/detail_destination/presentation/widget/top_nav_detail.dart';
import 'package:wizh/feature/home/model/place.dart';

/// A screen that displays detailed information about a destination.
class DetailDestinationScreen extends StatelessWidget {
  const DetailDestinationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final destination = ModalRoute.of(context)?.settings.arguments as Place;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const TopNavDetail(),
                    DestinationCard(destination: destination),
                    TermsCard(destination: destination),
                    const SizedBox(height: AppSpacing.m),
                    _buildTabBar(),
                    _buildTabBarView(destination),
                  ],
                ),
              ),
            ),
            _PriceSection(destination: destination),
          ],
        ),
      ),
    );
  }

  /// Builds the [TabBar] for the destination details.
  Widget _buildTabBar() {
    return const TabBar(
      tabs: [
        Tab(text: "Overview"),
        Tab(text: "Itineraries"),
        Tab(text: "Reviews"),
      ],
      labelColor: AppColor.primaryColor,
      unselectedLabelColor: AppColor.blackGrey,
      indicatorColor: AppColor.primaryColor,
    );
  }

  /// Builds the [TabBarView] for the destination details.
  Widget _buildTabBarView(Place destination) {
    return SizedBox(
      height: 400,
      child: TabBarView(
        children: [
          _OverviewTab(destination: destination),
          ItinerariesTab(destination: destination),
          ReviewsTab(destination: destination),
        ],
      ),
    );
  }
}

/// Displays the overview of the destination.
class _OverviewTab extends StatelessWidget {
  final Place destination;

  const _OverviewTab({required this.destination});

  @override
  Widget build(BuildContext context) {
    return _buildTabContent(
      title: "About Destination",
      content: destination.desc,
    );
  }
}

/// A reusable widget to build tab content with a title and description.
Widget _buildTabContent({required String title, required String content}) {
  return Padding(
    padding: const EdgeInsets.all(AppSpacing.l),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: title),
        Text(
          content,
          style: AppTextStyle.instance.bodyMedium,
        ),
      ],
    ),
  );
}

/// A sticky bottom section that displays the total price and a book button.
class _PriceSection extends StatelessWidget {
  final Place destination;

  const _PriceSection({required this.destination});

  @override
  Widget build(BuildContext context) {
    final formattedPrice = _formatPrice(destination.price);

    return Container(
      padding: const EdgeInsets.all(AppSpacing.m),
      decoration: const BoxDecoration(
        color: AppColor.white,
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowBlack,
            blurRadius: 16,
            offset: Offset(0, -4),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _PriceText(price: formattedPrice),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSpacing.m),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.xl,
                vertical: AppSpacing.m,
              ),
            ),
            child: Text(
              "BOOK NOW",
              style: AppTextStyle.instance.bodyMedium.copyWith(
                color: AppColor.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Formats the price using Indonesian locale (IDR).
  String _formatPrice(int price) {
    return intl.NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'IDR ',
      decimalDigits: 0,
    ).format(price);
  }
}

/// Displays the formatted price text.
class _PriceText extends StatelessWidget {
  final String price;

  const _PriceText({required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Total Price",
          style: AppTextStyle.instance.bodySmall.copyWith(
            color: AppColor.blackGrey,
          ),
        ),
        Text(
          price,
          style: AppTextStyle.instance.headlineSmall.copyWith(
            color: AppColor.primaryColor,
          ),
        ),
      ],
    );
  }
}