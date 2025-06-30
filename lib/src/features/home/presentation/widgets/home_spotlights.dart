import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/features/home/presentation/widgets/header/spotlights_header.dart';

class HomeSpotlights extends StatelessWidget {
  const HomeSpotlights({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SpotlightsHeader(),
          SizedBox(height: 8),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: AppImages.spotlight.length,
            separatorBuilder: (context, index) => const SizedBox(height: 18),
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(
                  AppImages.spotlight[index],
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
