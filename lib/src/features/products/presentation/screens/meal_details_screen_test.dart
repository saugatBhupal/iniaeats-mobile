import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_enums.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/core/widgets/buttons/back_button.dart';
import 'package:inaeats/src/core/widgets/buttons/icon_button.dart';
import 'package:inaeats/src/core/widgets/symbols/food_mark_symbol.dart';
import 'package:inaeats/src/features/products/presentation/widgets/tabview/details_tabview.dart';
import 'package:inaeats/src/features/products/presentation/widgets/tabview/ingredients_tabview.dart';

class MealDetailsScreenTest extends StatefulWidget {
  const MealDetailsScreenTest({Key? key}) : super(key: key);

  @override
  State<MealDetailsScreenTest> createState() => _MealDetailsScreenTestState();
}

class _MealDetailsScreenTestState extends State<MealDetailsScreenTest>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  final List<ScrollController> _tabScrollControllers = List.generate(3, (_) => ScrollController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    for (var controller in _tabScrollControllers) {
      controller.dispose();
    }
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final maxHeight = context.height / 1.8;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder:
              (context, _) => [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: maxHeight,
                  backgroundColor: Colors.black,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(AppImages.mealDetails, fit: BoxFit.cover),
                        Positioned(
                          top: context.statusBarSize > 60 ? 58 : context.statusBarSize,
                          left: 16,
                          right: 16,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              AppbarBackButton(),
                              Text(AppStrings.swipeDown, style: TextStyle(color: Colors.white70)),
                              CustomIconButton(icon: AppIcons.cart, count: 10),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 16,
                          right: 16,
                          bottom: 16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text(
                                      "Vegan Olio Spaghetti Kit",
                                      style: context.headlineSmall.copyWith(
                                        fontWeight: FontThickness.semiBold,
                                        color: AppColors.white,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  const FoodMarkSymbol(
                                    foodMark: FoodMark.veg,
                                    padding: 6,
                                    circleSize: 8,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Enjoy a delicious, plant-based twist on a classic Italian favorite...",
                                textAlign: TextAlign.justify,
                                style: context.bodySmall.copyWith(
                                  color: AppColors.border,
                                  fontSize: 11,
                                  fontWeight: FontThickness.light,
                                  height: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  bottom: TabBar(
                    controller: _tabController,
                    tabs: const [
                      Tab(text: AppStrings.ingredients),
                      Tab(text: AppStrings.details),
                      Tab(text: AppStrings.reviews),
                    ],
                    indicatorColor: AppColors.green,
                    labelColor: AppColors.green,
                    unselectedLabelColor: Colors.white,
                  ),
                ),
              ],
          body: TabBarView(
            controller: _tabController,
            children: [
              IngredientsTabview(scrollController: _tabScrollControllers[0]),
              DetailsTabview(scrollController: _tabScrollControllers[1]),
              DetailsTabview(scrollController: _tabScrollControllers[2]),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(30, 6, 30, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              // Add your quantity stepper and cart button here
              Text("Quantity Stepper Here"),
              Text("Add to Cart Button Here"),
            ],
          ),
        ),
      ),
    );
  }
}
