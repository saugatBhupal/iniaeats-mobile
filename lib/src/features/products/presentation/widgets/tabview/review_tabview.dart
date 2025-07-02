import 'package:flutter/material.dart';
import 'package:inaeats/src/features/products/presentation/widgets/review_widgets/rating_stars_container.dart';
import 'package:inaeats/src/features/products/presentation/widgets/review_widgets/testimonial_list.dart';

class ReviewTabview extends StatelessWidget {
  final ScrollController? scrollController;
  const ReviewTabview({super.key, this.scrollController});

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      padding: const EdgeInsets.only(bottom: 10),
      children: [
        ReviewContainer(starCount: 4),
        const SizedBox(height: 30),
        TestimonialList(),
        const SizedBox(height: 120),
      ],
    );
  }
}
