import 'package:flutter/material.dart';
import 'package:repomed/constants.dart';
import '../cubits/all_api_cubit/all_api_cubit.dart';
import '../generated/l10n.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_order_card.dart';
import '../widgets/custom_slide.dart';

class OrdersView extends StatelessWidget {
  OrdersView({Key? key, this.index}) : super(key: key);

  static String id = 'OrdersView';
  int? index;
  @override
  Widget build(BuildContext context) {
    AllApiCubit cubit = AllApiCubit.get(context);
    return Scaffold(
      body: Row(
        children: [
          Expanded(flex: 1, child: CustomSlide()),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                SizedBox(
                  height: 18,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 2, color: kPrimaryColor))),
                  child: Text(
                    S.of(context).All_Orders,
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount: cubit.showCartModel?.data?.length,
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 20, // x
                      mainAxisSpacing: 0, // y
                    ),
                    itemBuilder: (context, index) {
                      return CustomOrderCard(
                        // cart: '${cubit.orderModel?.data?[index].cartId}',
                        id: '${cubit.showCartModel?.data?[index].order_id}',
                        medicineName:
                            '${cubit.showCartModel?.data?[index].medicineName}',
                        quantity:
                            '${cubit.showCartModel?.data?[index].quantity}',
                        cart_id: '${cubit.showCartModel?.data?[index].cart_id}',
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
