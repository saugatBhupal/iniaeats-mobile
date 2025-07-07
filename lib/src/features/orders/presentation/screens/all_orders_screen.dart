import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inaeats/src/config/dependency_injection/dependency_injector.dart';
import 'package:inaeats/src/core/widgets/appbar/TitleAppbar.dart';
import 'package:inaeats/src/features/offers/presentation/widgets/offers_appbar.dart';
import 'package:inaeats/src/features/orders/presentation/bloc/order_bloc.dart';
import 'package:inaeats/src/features/orders/presentation/widgets/card/orders_card.dart';
import 'package:inaeats/src/features/orders/presentation/widgets/orders_container.dart';

class AllOrdersScreen extends StatelessWidget {
  const AllOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OffersAppbar(),
      body: BlocProvider(
        create: (context) => sl<OrderBloc>()..add(GetAllOrders()),
        child: BlocBuilder<OrderBloc, OrderState>(
          builder: (context, state) {
            if (state is GetAllOrdersLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetAllOrdersSuccess) {
              return ListView.separated(
                itemCount: state.orders.length,
                itemBuilder: (context, index) {
                  final reversedIndex = state.orders.length - 1 - index;
                  final order = state.orders[reversedIndex];
                  return OrdersContainer(order: order, isFirst: index == 0);
                },
                separatorBuilder: (context, index) => const SizedBox(width: 8),
              );
            } else if (state is GetAllOrdersFailed) {
              return Center(child: Text(state.message));
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
