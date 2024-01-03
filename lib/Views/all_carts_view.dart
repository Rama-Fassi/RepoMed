import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repomed/Views/update_cart_view.dart';
import 'package:repomed/app_localizations.dart';
import 'package:repomed/constants.dart';
import '../cubits/all_api_cubit/all_api_cubit.dart';
import '../generated/l10n.dart';
import '../helper/show_snack_bar.dart';
import '../widgets/check_language.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_slide.dart';
import 'orders_view.dart';

class AllCartsView extends StatefulWidget {
  const AllCartsView({Key? key}) : super(key: key);
  static String id = 'AllCartsView';

  @override
  State<AllCartsView> createState() => _AllCartsViewState();
}

class _AllCartsViewState extends State<AllCartsView> {
  late ScrollController _controller;
  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AllApiCubit cubit = AllApiCubit.get(context);
    return BlocConsumer<AllApiCubit, AllApiState>(
        listener: (context, state) {
          if (state is ShowCartLoading) {
            isLoading = true;
          } else if (state is ShowCartSuccess) {
            Navigator.pushNamed(context, OrdersView.id);
            isLoading = false;
          } else if (state is ShowCartFailure) {
            showSnakbar(context, state.errMessage);
            isLoading = false;
          }
        },
        builder: (context, state) => BlurryModalProgressHUD(
            inAsyncCall: isLoading,
            child: Scaffold(
              body: Row(
                children: [
                  Expanded(flex: 1, child: CustomSlide()),
                  Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Left Arrow Button
                              IconButton(
                                icon: Icon(
                                  Language.isEnglish(context)
                                      ? Icons.keyboard_arrow_left
                                      : Icons.keyboard_arrow_right,
                                  size: 50,
                                  color: kPrimaryColor,
                                ),
                                onPressed: () {
                                  _scrollListView(-1); // Scroll to the left
                                },
                              ),
                              Text(
                                "All_Carts_details".tr(context),
                                style: TextStyle(
                                    fontSize: 25, color: kPrimaryColor),
                              ),
                              // Right Arrow Button
                              IconButton(
                                icon: Icon(
                                  Language.isEnglish(context)
                                      ? Icons.keyboard_arrow_right
                                      : Icons.keyboard_arrow_left,
                                  size: 50,
                                  color: kPrimaryColor,
                                ),
                                onPressed: () {
                                  _scrollListView(1); // Scroll to the right
                                },
                              ),
                            ],
                          ),
                          Expanded(
                            child: ListView.builder(
                              controller: _controller,
                              scrollDirection: Axis.horizontal,
                              itemCount: cubit.cartModel?.data?.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 80),
                                  width: 300,
                                  height: 800,
                                  color: Colors.white,
                                  child: Container(
                                    height: 800,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade50,
                                      border: Border.all(
                                          width: 3, color: kPrimaryColor),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(50),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                            color: kPrimaryColor,
                                            width: 2,
                                          ))),
                                          child: Text(
                                              '${"Cart".tr(context)} ${cubit.cartModel?.data?[index].id}',
                                              style: const TextStyle(
                                                  color: kPrimaryColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 30)),
                                        ),
                                        const SizedBox(height: 10),
                                        Column(
                                          children: [
                                            Container(
                                                width: 250,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: kPrimaryColor,
                                                      width: 1.5),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Center(
                                                    child: Text(
                                                  '${"User_id".tr(context)}: ${cubit.cartModel?.data?[index].userId} ',
                                                  style: const TextStyle(
                                                      color: kPrimaryColor,
                                                      fontSize: 20),
                                                ))),
                                            kSizedBoxless,
                                            Container(
                                                width: 250,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: kPrimaryColor,
                                                      width: 1.5),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Center(
                                                    child: Text(
                                                  '${"Status".tr(context)}: ${cubit.cartModel?.data?[index].status} ',
                                                  style: const TextStyle(
                                                      color: kPrimaryColor,
                                                      fontSize: 20),
                                                ))),
                                            kSizedBoxless,
                                            Container(
                                                width: 250,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: kPrimaryColor,
                                                      width: 1.5),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Center(
                                                    child: Text(
                                                  '${"Paid_Status".tr(context)}: ${cubit.cartModel?.data?[index].paidStatus}',
                                                  style: const TextStyle(
                                                      color: kPrimaryColor,
                                                      fontSize: 20),
                                                ))),
                                            kSizedBoxless,
                                            Container(
                                                width: 250,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: kPrimaryColor,
                                                      width: 1.5),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Center(
                                                    child: Text(
                                                  '${"Created_at".tr(context)}: ${cubit.cartModel?.data?[index].createdAt}',
                                                  style: const TextStyle(
                                                      color: kPrimaryColor,
                                                      fontSize: 20),
                                                ))),
                                            kSizedBoxless,
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CustomButton(
                                                onTap: () {
                                                  Navigator.push(context,
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                    return UpdateCartView(
                                                      index: index,
                                                      // cubit.cartModel
                                                      //     ?.data?[index].id,
                                                    );
                                                  }));
                                                },
                                                text: "Edit".tr(context),
                                                width: 100,
                                                borderRadius: 8,
                                                padding: 8,
                                                height: 40),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            CustomButton(
                                                onTap: () {
                                                  BlocProvider.of<AllApiCubit>(
                                                          context)
                                                      .showCart(context,
                                                          id: cubit
                                                              .cartModel
                                                              ?.data?[index]
                                                              .id);
                                                },
                                                text: "details3".tr(context),
                                                width: 100,
                                                borderRadius: 8,
                                                padding: 8,
                                                height: 40),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 40,
                                        ),
                                      ],
                                    ),
                                  ),

                                  // CartBody(
                                  //   id: cubit.cartModel?.data?[index].id,
                                  //   user_id: '${cubit.cartModel?.data?[index].userId}',
                                  //   status: '${cubit.cartModel?.data?[index].status}',
                                  //   paid_status:
                                  //       '${cubit.cartModel?.data?[index].paidStatus}',
                                  //   createdAt:
                                  //       '${cubit.cartModel?.data?[index].createdAt}',
                                  // ),
                                );
                              },
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            )));
  }

  void _scrollListView(int direction) {
    // Calculate the new offset based on the current offset and the direction
    final double newOffset = _controller.offset + (direction * 200.0);

    // Scroll to the new offset
    _controller.animateTo(
      newOffset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: 5,
//               itemBuilder: (context, index) {
//                 return Container(
//                   margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
//                   width: 400,
//                   height: 600,
//                   color: Colors.white,
//                   child: CartBody(),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
