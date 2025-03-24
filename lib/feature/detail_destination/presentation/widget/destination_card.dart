import 'package:flutter/material.dart';
import 'package:wizh/core/theme/app_color.dart';
import 'package:wizh/core/theme/app_spacing.dart';
import 'package:wizh/core/theme/app_textsyle.dart';
import 'package:wizh/feature/home/model/place.dart';

class DestinationCard extends StatelessWidget {
  final Place destination;

  const DestinationCard({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.m,
        vertical: AppSpacing.xl,
      ),
      padding: const EdgeInsets.all(AppSpacing.s),
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
          DestinationImage(asset: destination.asset),
          DestinationDetails(destination: destination),
        ],
      ),
    );
  }
}

class DestinationImage extends StatelessWidget {
  final String asset;

  const DestinationImage({super.key, required this.asset});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSpacing.m),
        image: DecorationImage(
          image: AssetImage(asset),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: AppSpacing.m,
            bottom: -20,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColor.shadowBlack.withAlpha(20),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: const FavoriteIcon(),
            ),
          ),
        ],
      ),
    );
  }
}

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColor.white,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.favorite,
        color: AppColor.red,
        size: 24,
      ),
    );
  }
}

class DestinationDetails extends StatelessWidget {
  final Place destination;

  const DestinationDetails({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.place, size: 12, color: AppColor.red),
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
          const SizedBox(height: AppSpacing.s),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  destination.name,
                  style: AppTextStyle.instance.titleSmall.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.visible,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.star, size: 12, color: Colors.amber),
                  const SizedBox(width: AppSpacing.xs),
                  Text(
                    destination.rating.toString(),
                    style: AppTextStyle.instance.bodySmall,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.s),
          Text(
            destination.headline,
            style: AppTextStyle.instance.bodySmall,
          ),
          const SizedBox(height: AppSpacing.s),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.calendar_today, size: 12, color: AppColor.blackGrey),
              const SizedBox(width: AppSpacing.xs),
              Flexible(
                child: Text(
                  destination.date,
                  style: AppTextStyle.instance.bodySupperSmall,
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}