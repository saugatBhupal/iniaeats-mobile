import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/core/widgets/textspan/icon_title.dart';
import 'package:inaeats/src/features/products/domain/entities/review.dart';
import 'package:inaeats/src/features/products/presentation/widgets/review_widgets/testimonial_card.dart';

class TestimonialList extends StatelessWidget {
  TestimonialList({super.key});
  final sampleTestimonials = [
    Review(
      name: "Sarina Magar",
      starCount: 5,
      dateTime: DateTime.now().subtract(const Duration(days: 20)),
      review:
          "InaEats saved my dinner parties! The recipes are easy, the ingredients are fresh, and the results are restaurant-quality. My guests were impressed—and I didn’t even break a sweat!",
    ),
    Review(
      name: "Raj Thapa",
      starCount: 4,
      dateTime: DateTime.now().subtract(const Duration(days: 10)),
      review: "Love the portion control and nutrition info. Super helpful when tracking my macros.",
    ),
    Review(
      name: "Anita Shrestha",
      starCount: 3,
      dateTime: DateTime.now().subtract(const Duration(days: 5)),
      review: "Great taste but delivery was slightly delayed. Still a good experience overall.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconTitle(label: "Testimonials", fontSize: 14),
              Text(
                "(Hear from your customers)",
                style: context.labelLarge.copyWith(color: AppColors.black.withOpacity(0.45)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...List.generate(sampleTestimonials.length, (index) {
            final t = sampleTestimonials[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: TestimonialCard(
                name: t.name,
                starCount: t.starCount,
                dateTime: t.dateTime,
                review: t.review,
              ),
            );
          }),
        ],
      ),
    );
  }
}
