import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/widgets/textspan/icon_title.dart';
import 'package:inaeats/src/features/search/presentation/widgets/chip/filter_chip.dart';

class SearchFilter extends StatelessWidget {
  const SearchFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> _filters = [
      "Meal Kit",
      "Ready to Eat",
      "Price : Low-High",
      "Price : High-Low",
      "Discount/Promo",
      "Vegan",
      "Lactose Intolerant",
    ];

    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(
        children: [
          IconTitle(label: AppStrings.filter),
          SizedBox(width: 8),
          Expanded(
            child: ClipPath(
              clipper: LeftConcaveClipper(),
              child: Container(
                // height: 42,
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: FiltersChip(filterList: _filters),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LeftConcaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    const double curveDepth = 14; // Depth of the concave curve
    final height = size.height;

    path.moveTo(curveDepth, 0); // Start after the left curve

    // Top edge straight to right edge
    path.lineTo(size.width, 0);

    // Right edge straight down
    path.lineTo(size.width, height);

    // Bottom edge straight back to start of left curve
    path.lineTo(curveDepth, height);

    // Left side concave curve: bottom -> middle -> top
    path.quadraticBezierTo(
      -curveDepth / 1.2, // control point outside left edge
      height / 2,
      curveDepth,
      0,
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
