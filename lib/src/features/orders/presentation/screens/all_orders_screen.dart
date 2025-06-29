import 'package:flutter/material.dart';
import 'package:inaeats/src/core/widgets/appbar/TitleAppbar.dart';
import 'package:inaeats/src/features/orders/presentation/widgets/orders_container.dart';

class AllOrdersScreen extends StatelessWidget {
  const AllOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: TitleAppBar(title: "Recent Orders"), body: OrdersContainer());
  }
}
