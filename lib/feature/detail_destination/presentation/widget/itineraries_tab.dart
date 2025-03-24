import 'package:flutter/material.dart';
import 'package:wizh/core/theme/app_color.dart';
import 'package:wizh/core/theme/app_spacing.dart';
import 'package:wizh/core/theme/app_textsyle.dart';
import 'package:wizh/core/widget/section_header.dart';
import 'package:wizh/feature/home/model/place.dart';

/// Displays the itineraries of the destination.
class ItinerariesTab extends StatelessWidget {
  final Place destination;

  const ItinerariesTab({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    final itineraries = destination.itineraries;

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(title: "${destination.location} Itineraries"),
          const SizedBox(height: AppSpacing.m),
          Expanded( // Wrap the ListView in Expanded
            child: ListView.separated(
              shrinkWrap: true, // Allow the ListView to take only the space it needs
              physics: const AlwaysScrollableScrollPhysics(), // Enable scrolling
              itemCount: itineraries.length,
              separatorBuilder: (context, index) => const SizedBox(height: AppSpacing.l),
              itemBuilder: (context, index) {
                final itinerary = itineraries[index];
                return _ItineraryItem(itinerary: itinerary);
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// Displays a single itinerary item.
class _ItineraryItem extends StatelessWidget {
  final Itinerary itinerary;

  const _ItineraryItem({required this.itinerary});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.m),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(AppSpacing.m),
        boxShadow: [
          BoxShadow(
            color: AppColor.shadowBlack.withAlpha(10),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Time
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.m, vertical: AppSpacing.s),
            decoration: BoxDecoration(
              color: AppColor.shadowBlack.withAlpha(10),
              borderRadius: BorderRadius.circular(AppSpacing.m),
            ),
            child: Text(
              itinerary.time,
              style: AppTextStyle.instance.bodySmall.copyWith(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.m),
          // Activity and Description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itinerary.activity,
                  style: AppTextStyle.instance.bodyMedium.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: AppSpacing.s),
                Text(
                  itinerary.description,
                  style: AppTextStyle.instance.bodySmall.copyWith(
                    color: AppColor.blackGrey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}