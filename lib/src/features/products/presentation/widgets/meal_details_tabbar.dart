import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/features/products/domain/entities/product.dart';
import 'package:inaeats/src/features/products/presentation/widgets/tabview/details_tabview.dart';
import 'package:inaeats/src/features/products/presentation/widgets/tabview/ingredients_tabview.dart';
import 'package:inaeats/src/features/products/presentation/widgets/tabview/review_tabview.dart';

class MealDetailsTabbar extends StatelessWidget {
  final Product product;
  final ScrollController scrollController;

  const MealDetailsTabbar({Key? key, required this.scrollController, required this.product})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(top: 24, bottom: 16),
            decoration: BoxDecoration(
              color: AppColors.turtle,
              borderRadius: BorderRadius.circular(34),
            ),
            height: 40,
            child: TabBar(
              isScrollable: false,
              indicator: OversizedTabIndicator(height: 48, color: AppColors.green, radius: 30),
              indicatorPadding: const EdgeInsets.symmetric(vertical: 6.0),
              indicatorSize: TabBarIndicatorSize.tab,
              dividerHeight: 0,
              padding: const EdgeInsets.only(top: 4),
              tabAlignment: TabAlignment.center,
              unselectedLabelColor: AppColors.green,
              labelStyle: context.bodySmall.copyWith(color: AppColors.white),
              unselectedLabelStyle: context.bodySmall.copyWith(fontWeight: FontThickness.semiBold),
              labelPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 32.8),
              splashFactory: NoSplash.splashFactory,
              tabs: [
                Tab(text: AppStrings.ingredients),
                Tab(text: AppStrings.details),
                Tab(text: AppStrings.reviews),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                IngredientsTabview(
                  scrollController: scrollController,
                  shelfLife: product.shelfLife,
                ),
                DetailsTabview(scrollController: scrollController, product: product),
                ReviewTabview(scrollController: scrollController),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OversizedTabIndicator extends Decoration {
  final double height;
  final Color color;
  final double radius;

  const OversizedTabIndicator({this.height = 40, required this.color, this.radius = 12});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _OversizedTabIndicatorPainter(this);
  }
}

class _OversizedTabIndicatorPainter extends BoxPainter {
  final OversizedTabIndicator decoration;

  _OversizedTabIndicatorPainter(this.decoration);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration config) {
    final Paint paint = Paint()..color = decoration.color;
    final double indicatorHeight = decoration.height;
    final double indicatorWidth = config.size!.width;
    final double dx = offset.dx;
    final double dy = offset.dy - (indicatorHeight - config.size!.height) / 1.75;

    final Rect rect = Rect.fromLTWH(dx, dy, indicatorWidth, indicatorHeight);
    final RRect rRect = RRect.fromRectAndRadius(rect, Radius.circular(decoration.radius));
    canvas.drawRRect(rRect, paint);
  }
}
