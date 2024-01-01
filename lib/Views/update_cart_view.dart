import 'package:flutter/material.dart';
import 'package:repomed/constants.dart';
import '../cubits/all_api_cubit/all_api_cubit.dart';
import '../generated/l10n.dart';
import '../widgets/custom_slide.dart';
import '../widgets/edit_cart_body.dart';

class UpdateCartView extends StatelessWidget {
  UpdateCartView({Key? key, this.index}) : super(key: key);
  static String id = 'UpdateCartView';
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    '${S.of(context).Edit_Carts} $index',
                    style: TextStyle(
                        fontSize: 30,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                    width: 400,
                    height: 500,
                    color: Colors.white,
                    child: EditCartBody(
                      index: index,
                      user_id: '${cubit.cartModel?.data?[index!].userId}',
                      createdAt: '${cubit.cartModel?.data?[index!].createdAt}',
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
