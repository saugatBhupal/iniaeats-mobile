import 'package:flutter/material.dart';
import 'package:inaeats/src/core/widgets/backgroud/gradient_background.dart';
import 'package:inaeats/src/features/offers/presentation/widgets/offers_appbar.dart';
import 'package:inaeats/src/features/offers/presentation/widgets/tab_view/offers_tab.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: OffersAppbar(), body: GradientBackground(child: OffersTab()));
  }
}
