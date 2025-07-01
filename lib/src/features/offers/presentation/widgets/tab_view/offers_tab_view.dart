import 'package:flutter/material.dart';

class OffersTabView extends StatelessWidget {
  final List<String> offers;
  const OffersTabView({super.key, required this.offers});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          physics: const AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(offers.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      offers[index],
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
