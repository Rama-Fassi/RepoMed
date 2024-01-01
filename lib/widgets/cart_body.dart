import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repomed/Views/orders_view.dart';
import 'package:repomed/Views/update_cart_view.dart';

import '../constants.dart';
import '../cubits/all_api_cubit/all_api_cubit.dart';
import '../helper/show_snack_bar.dart';
import 'custom_button.dart';

class CartBody extends StatelessWidget {
  CartBody({
    Key? key,
    this.index,
    this.id,
    this.user_id,
    this.status,
    this.paid_status,
    this.createdAt,
  }) : super(key: key);
  final int? index;
  final int? id;
  final String? user_id;
  final String? status;
  final String? paid_status;
  final String? createdAt;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AllApiCubit cubit = AllApiCubit.get(context);
    return BlocConsumer<AllApiCubit, AllApiState>(
        listener: (context, state) {
          if (state is AllOrdersLoading) {
            isLoading = true;
            Center(child: CircularProgressIndicator());
          } else if (state is AllOdersSuccess) {
            Navigator.pushNamed(context, OrdersView.id);
            isLoading = false;
          } else if (state is AllOrdersFailure) {
            showSnakbar(context, state.errMessage);
            isLoading = false;
          }
        },
        builder: (context, state) => BlurryModalProgressHUD(
              inAsyncCall: isLoading,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  border: Border.all(width: 3, color: kPrimaryColor),
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: kPrimaryColor,
                        width: 2,
                      ))),
                      child: Text('Cart ${id}',
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 30)),
                    ),
                    const SizedBox(height: 30),
                    Column(
                      children: [
                        Container(
                            width: 250,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(color: kPrimaryColor, width: 1.5),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                                child: Text(
                              'User_id: ${user_id} ',
                              style:
                                  TextStyle(color: kPrimaryColor, fontSize: 20),
                            ))),
                        kSizedBoxless,
                        Container(
                            width: 250,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(color: kPrimaryColor, width: 1.5),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                                child: Text(
                              'Status: ${status} ',
                              style:
                                  TextStyle(color: kPrimaryColor, fontSize: 20),
                            ))),
                        kSizedBoxless,
                        Container(
                            width: 250,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(color: kPrimaryColor, width: 1.5),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                                child: Text(
                              'Paid Status: ${paid_status}',
                              style:
                                  TextStyle(color: kPrimaryColor, fontSize: 20),
                            ))),
                        kSizedBoxless,
                        Container(
                            width: 250,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(color: kPrimaryColor, width: 1.5),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                                child: Text(
                              'Created At: ${createdAt}',
                              style:
                                  TextStyle(color: kPrimaryColor, fontSize: 20),
                            ))),
                        kSizedBoxless,
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return UpdateCartView(
                                  index: id,
                                );
                              }));
                            },
                            text: 'Edit',
                            width: 100,
                            borderRadius: 8,
                            padding: 8,
                            height: 40),
                        const SizedBox(
                          width: 10,
                        ),
                        CustomButton(
                            onTap: () {
                              BlocProvider.of<AllApiCubit>(context)
                                  .allOrders(context);
                            },
                            text: 'details',
                            width: 100,
                            borderRadius: 8,
                            padding: 8,
                            height: 40),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ));
  }
}
