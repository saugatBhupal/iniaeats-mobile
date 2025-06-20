import 'dart:async';
import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class PromoSlider extends StatefulWidget {
  const PromoSlider({super.key});

  @override
  State<PromoSlider> createState() => _PromoSliderState();
}

class _PromoSliderState extends State<PromoSlider> {
  int _currentPage = 0;
  late ScrollController _scrollController;
  Timer? _autoScrollTimer;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    // _startAutoScroll();
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 2), (_) {
      if (_scrollController.hasClients) {
        final nextPage = (_currentPage + 1) % AppImages.promos.length;
        final itemWidth = context.width * 0.8;

        _scrollController.animateTo(
          nextPage * itemWidth,
          duration: const Duration(milliseconds: 400),
          curve: Curves.fastOutSlowIn,
        );

        setState(() {
          _currentPage = nextPage;
        });
      }
    });
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = context.height / 4;
    final width = context.width * 0.8;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height,
          child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemExtent: width,
            itemCount: AppImages.promos.length,
            itemBuilder: (context, index) {
              return buildPage(AppImages.promos[index], height, index);
            },
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(AppImages.promos.length, (index) {
            final isActive = _currentPage == index;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: isActive ? 24 : 6,
              height: 6,
              decoration: BoxDecoration(
                color:
                    isActive
                        ? AppColors.green
                        : AppColors.green.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(12),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget buildPage(String imagePath, double height, int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Image.asset(imagePath, height: height),
      ),
    );
  }
}
