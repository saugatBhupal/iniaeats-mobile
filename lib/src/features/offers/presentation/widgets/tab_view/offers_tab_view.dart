import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';

class OffersTabView extends StatelessWidget {
  final String offers;
  const OffersTabView({super.key, required this.offers});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: 3,
        separatorBuilder: (context, index) => SizedBox(height: 24),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset(
              AppImages.spotlightCard,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
