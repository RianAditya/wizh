import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import the intl package
import 'package:wizh/core/route/app_route_name.dart';
import 'package:wizh/core/theme/app_color.dart';
import 'package:wizh/core/theme/app_spacing.dart'; // Import AppTextStyle
import 'package:wizh/core/theme/app_textsyle.dart';
import 'package:wizh/feature/home/model/place.dart';

/// A widget that displays a list of destinations specially curated for the user.
class ForYouDestinationWidget extends StatelessWidget {
  const ForYouDestinationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: specialForYou.length,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.m),
      itemBuilder: (context, index) {
        final place = specialForYou[index];
        return _DestinationCard(place: place);
      },
    );
  }
}

/// A widget that represents a destination card.
class _DestinationCard extends StatelessWidget {
  final Place place;

  const _DestinationCard({required this.place});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToDetail(context, place),
      child: Container(
        width: MediaQuery.of(context).size.width - 2 * AppSpacing.xxl,
        margin: const EdgeInsets.only(bottom: AppSpacing.xl),
        decoration: _cardDecoration,
        padding: const EdgeInsets.all(AppSpacing.s),
        child: Row(
          children: [
            _DestinationImage(place: place),
            const SizedBox(width: AppSpacing.m),
            _DestinationDetails(place: place),
          ],
        ),
      ),
    );
  }

  void _navigateToDetail(BuildContext context, Place place) {
    Navigator.pushNamed(
      context,
      AppRouteName.detailDestination,
      arguments: place,
    );
  }

  static final BoxDecoration _cardDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(AppSpacing.m),
    color: AppColor.white,
    boxShadow: const [
      BoxShadow(
        color: AppColor.shadowBlack,
        blurRadius: 8,
        offset: Offset(0, 4),
      ),
    ],
  );
}

/// A widget that represents the destination image.
class _DestinationImage extends StatelessWidget {
  final Place place;

  const _DestinationImage({required this.place});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSpacing.m),
        image: DecorationImage(
          image: AssetImage(place.asset),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

/// A widget that represents the destination details.
class _DestinationDetails extends StatelessWidget {
  final Place place;

  const _DestinationDetails({required this.place});

  @override
  Widget build(BuildContext context) {
    // Format the price using NumberFormat
    final priceFormatter = NumberFormat.currency(
      locale: 'id_ID', // Use Indonesian locale for IDR
      symbol: 'IDR ',
      decimalDigits: 0, // No decimal digits
    );
    final formattedPrice = priceFormatter.format(place.price);

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Place Name
          Text(
            place.name,
            style: AppTextStyle.instance.titleMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: AppSpacing.s),

          // Location
          _LocationRow(place: place),
          const SizedBox(height: AppSpacing.s),

          // Rating
          Row(
            children: [
              const Icon(
                Icons.star,
                size: 12,
                color: Colors.amber,
              ),
              const SizedBox(width: AppSpacing.xs),
              Text(
                place.rating.toString(), // Assuming `rating` is a field in the `Place` model
                style: AppTextStyle.instance.bodySmall,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.s),

          // Price and /Pax
          _PriceText(price: formattedPrice),
        ],
      ),
    );
  }
}

/// A widget that represents the location row with icon and text.
class _LocationRow extends StatelessWidget {
  final Place place;

  const _LocationRow({required this.place});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.place,
          size: 12,
          color: AppColor.red,
        ),
        const SizedBox(width: AppSpacing.xs),
        Text(
          place.location,
          style: AppTextStyle.instance.bodySupperSmall,
        ),
      ],
    );
  }
}

/// A widget that represents the price text with rich formatting.
class _PriceText extends StatelessWidget {
  final String price;

  const _PriceText({required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          price, // Use the formatted price
          style: AppTextStyle.instance.bodyMedium.copyWith(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.w900,
              ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: AppSpacing.s),
          child: Text(
            "/Pax",
            style: AppTextStyle.instance.bodySmall,
          ),
        ),
      ],
    );
  }
}