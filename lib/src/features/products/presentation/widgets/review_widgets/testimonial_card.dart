import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/core/utils/date_time_utils.dart';
import 'package:inaeats/src/core/widgets/symbols/dashed_line.dart';

class TestimonialCard extends StatelessWidget {
  final String name;
  final String review;
  final int starCount;
  final DateTime dateTime;

  const TestimonialCard({
    super.key,
    required this.name,
    required this.review,
    required this.starCount,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Header(name: name, starCount: starCount, dateTime: dateTime),
        const SizedBox(height: 14),
        Text(
          review,
          style: context.bodySmall.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.black.withValues(alpha: 0.45),
          ),
        ),
        const SizedBox(height: 18),
        const DashedLine(),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  final String name;
  final int starCount;
  final DateTime dateTime;

  const _Header({required this.name, required this.starCount, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _NameAndStars(name: name, starCount: starCount),
        Text(
          formatCustomDate(dateTime),
          style: context.bodySmall.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class _NameAndStars extends StatelessWidget {
  final String name;
  final int starCount;

  const _NameAndStars({required this.name, required this.starCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, style: context.bodyLarge),
        const SizedBox(height: 2),
        Row(
          children: List.generate(starCount, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 5),
              child: SvgPicture.asset(
                AppIcons.rating,
                height: 18,
                colorFilter: const ColorFilter.mode(AppColors.green, BlendMode.srcIn),
              ),
            );
          }),
        ),
      ],
    );
  }
}
