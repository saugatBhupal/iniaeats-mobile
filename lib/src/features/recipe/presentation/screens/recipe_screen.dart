import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/features/recipe/presentation/widgets/components/recipe_video.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/core/widgets/buttons/back_button.dart';
import 'package:inaeats/src/features/recipe/presentation/widgets/recipe_details.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          SizedBox(width: double.infinity, height: context.height / 1.25, child: RecipeVideo()),
          Positioned(
            top: context.statusBarSize > 60 ? 58 : context.statusBarSize,
            left: 16,
            child: AppbarBackButton(),
          ),
          const RecipeDetails(),
        ],
      ),
    );
  }
}
