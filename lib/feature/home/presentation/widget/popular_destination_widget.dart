import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import the intl package
import 'package:wizh/core/route/app_route_name.dart';
import 'package:wizh/core/theme/app_color.dart';
import 'package:wizh/core/theme/app_spacing.dart';
import 'package:wizh/core/theme/app_textsyle.dart';
import 'package:wizh/feature/home/model/place.dart';

/// A widget that displays a horizontal list of popular destinations.
class PopularDestinationWidget extends StatelessWidget {
  const PopularDestinationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.m),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: constraints.maxWidth, // Ensure the width matches the parent
            ),
            child: IntrinsicHeight(
              child: Row(
                children: popularDestination.map((destination) {
                  return GestureDetector(
                    onTap: () => _navigateToDetail(context, destination),
                    child: _DestinationCard(destination: destination),
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }

  /// Navigates to the detail screen for the given [destination].
  void _navigateToDetail(BuildContext context, Place destination) {
    Navigator.pushNamed(
      context,
      AppRouteName.detailDestination,
      arguments: destination,
    );
  }
}

/// A widget that represents a card for a popular destination.
class _DestinationCard extends StatelessWidget {
  final Place destination;

  const _DestinationCard({required this.destination});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      margin: const EdgeInsets.only(right: AppSpacing.xl, bottom: 10),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(AppSpacing.m),
        boxShadow: const [
          BoxShadow(
            color: AppColor.shadowBlack,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _DestinationImage(asset: destination.asset),
          _DestinationDetails(destination: destination),
        ],
      ),
    );
  }
}

/// A widget that displays the image of a destination.
class _DestinationImage extends StatelessWidget {
  final String asset;

  const _DestinationImage({required this.asset});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(AppSpacing.m)),
        image: DecorationImage(
          image: AssetImage(asset),
          fit: BoxFit.cover,
        ),
      ),
      padding: const EdgeInsets.all(AppSpacing.m),
      alignment: Alignment.topRight,
      child: const _FavoriteIcon(),
    );
  }
}

/// A widget that represents a favorite icon.
class _FavoriteIcon extends StatelessWidget {
  const _FavoriteIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.s),
      decoration: const BoxDecoration(
        color: AppColor.white,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.favorite,
        color: AppColor.red,
      ),
    );
  }
}

/// A widget that displays the details of a destination (name, location, rating, and price).
class _DestinationDetails extends StatelessWidget {
  final Place destination;

  const _DestinationDetails({required this.destination});

  @override
  Widget build(BuildContext context) {
    // Format the price using NumberFormat
    final priceFormatter = NumberFormat.currency(
      locale: 'id_ID', // Use Indonesian locale for IDR
      symbol: 'IDR ',
      decimalDigits: 0, // No decimal digits
    );
    final formattedPrice = priceFormatter.format(destination.price);

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Location
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.place,
                size: 12,
                color: AppColor.red,
              ),
              const SizedBox(width: AppSpacing.xs),
              Flexible(
                child: Text(
                  destination.location,
                  style: AppTextStyle.instance.bodySupperSmall,
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),

          const SizedBox(height: AppSpacing.s), // Add spacing

          // Card Title and Rating
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Card Title (Left-aligned)
              Flexible(
                child: Text(
                  destination.name,
                  style: AppTextStyle.instance.titleSmall.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  overflow: TextOverflow.visible,
                ),
              ),

              // Rating (Right-aligned)
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    size: 12,
                    color: Colors.amber,
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Text(
                    destination.rating.toString(), // Assuming `rating` is a field in the `Place` model
                    style: AppTextStyle.instance.bodySmall,
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: AppSpacing.s), // Add spacing

          // Headline
          Text(
            destination.headline,
            style: AppTextStyle.instance.bodySmall,
          ),

          const SizedBox(height: AppSpacing.s), // Add spacing

          // Price and /Pax
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Price (Left-aligned)
              Text(
                formattedPrice, // Use the formatted price
                style: AppTextStyle.instance.bodyMedium.copyWith(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.w900,
                    ),
              ),

              // /Pax (Right-aligned)
              Text(
                "/Pax",
                style: AppTextStyle.instance.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}