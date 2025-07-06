import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inaeats/src/core/constants/app_enums.dart';
import 'package:inaeats/src/features/orders/presentation/bloc/order_bloc.dart';
import 'package:inaeats/src/features/orders/presentation/widgets/card/address_card.dart';

class OrderAddressList extends StatelessWidget {
  const OrderAddressList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        final selected = context.watch<OrderBloc>().addressType;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AddressCard(
              addressType: AddressType.current,
              address: "Naxal Bhagwati Temple Kathmandu काठमाडौँ, Nepal",
              isSelected: selected == AddressType.current,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: AddressCard(
                    addressType: AddressType.home,
                    address: "Solteemode Kathmandu काठमाडौँ, Nepal",
                    isSelected: selected == AddressType.home,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: AddressCard(
                    addressType: AddressType.work,
                    address: "Kalimati Karkhana Kathmandu काठमाडौँ, Nepal",
                    isSelected: selected == AddressType.work,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
