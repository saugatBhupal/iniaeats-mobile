import 'package:flutter/material.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/core/widgets/appbar/TitleAppbar.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar(title: "Place Order"),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: context.height / 2,
            child: Image.asset(AppImages.map, fit: BoxFit.cover, alignment: Alignment.topCenter),
          ),
        ],
      ),
    );
  }
}
