import 'package:flutter/material.dart';
import 'package:wizh/core/theme/app_color.dart';
import 'package:wizh/core/theme/app_spacing.dart';
import 'package:wizh/core/theme/app_textsyle.dart';
import 'package:wizh/core/widget/section_header.dart';
import 'package:wizh/feature/home/model/place.dart';

/// Displays the reviews of the destination.
class ReviewsTab extends StatelessWidget {
  final Place destination;

  const ReviewsTab({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    final reviews = [
      Review(
        profileImage: destination.testimonials[0],
        name: "John Doe",
        rating: 4.5,
        comment: "Amazing experience! The tour was well-organized and the guides were very knowledgeable.",
      ),
      Review(
        profileImage: destination.testimonials[1],
        name: "Jane Smith",
        rating: 5.0,
        comment: "Absolutely loved it! The scenery was breathtaking, and the activities were so much fun.",
      ),
      Review(
        profileImage: destination.testimonials[2],
        name: "Alice Johnson",
        rating: 4.0,
        comment: "Great trip overall. The food was delicious, and the accommodations were comfortable.",
      ),
      Review(
        profileImage: destination.testimonials[3],
        name: "Bob Brown",
        rating: 4.8,
        comment: "Highly recommend this tour. Everything was perfect, from start to finish.",
      ),
    ];

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: "Reviews"),
          const SizedBox(height: AppSpacing.m),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: reviews.length,
              separatorBuilder: (context, index) => const SizedBox(height: AppSpacing.l),
              itemBuilder: (context, index) {
                final review = reviews[index];
                return _ReviewItem(review: review);
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// Represents a single review.
class Review {
  final String profileImage;
  final String name;
  final double rating;
  final String comment;

  Review({
    required this.profileImage,
    required this.name,
    required this.rating,
    required this.comment,
  });
}

/// Displays a single review item.
class _ReviewItem extends StatelessWidget {
  final Review review;

  const _ReviewItem({required this.review});

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
          // Profile Image
          CircleAvatar(
            backgroundImage: AssetImage(review.profileImage),
            radius: 24,
          ),
          const SizedBox(width: AppSpacing.m),
          // Name, Rating, and Comment
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review.name,
                  style: AppTextStyle.instance.bodyMedium.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: AppSpacing.s),
                Row(
                  children: [
                    const Icon(Icons.star, size: 16, color: Colors.amber),
                    const SizedBox(width: AppSpacing.xs),
                    Text(
                      review.rating.toString(),
                      style: AppTextStyle.instance.bodySmall.copyWith(
                        color: AppColor.blackGrey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.s),
                Text(
                  review.comment,
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