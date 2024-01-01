import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repomed/widgets/custom_Text_Field.dart';
import '../constants.dart';
import '../cubits/all_api_cubit/all_api_cubit.dart';
import '../generated/l10n.dart';
import '../helper/show_snack_bar.dart';
import 'custom_button.dart';

class EditCartBody extends StatefulWidget {
  EditCartBody(
      {Key? key,
      this.index,
      this.id,
      this.user_id,
      this.status,
      this.paid_status,
      this.createdAt})
      : super(key: key);
  int? index;
  final String? id;
  final String? user_id;
  String? status;
  String? paid_status;
  final String? createdAt;

  @override
  State<EditCartBody> createState() => _EditCartBodyState();
}

class _EditCartBodyState extends State<EditCartBody> {
  bool isLoading = false;

  String? selectedStatus;
  String? selectedPaidStatus;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllApiCubit, AllApiState>(
        listener: (context, state) {
          if (state is UpdateCartLoading) {
            isLoading = true;
          } else if (state is UpdateCartSuccess) {
            showSnakbar(context, S.of(context).Cart_Update_Successfully);
            isLoading = false;
          } else if (state is UpdateCartFailure) {
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(28),
                    // child: CustomTextField(
                    //   labelText: S.of(context).Status,
                    //   onChanged: (value) {
                    //     status = value;
                    //   },
                    // ),
                    child: Container(
                      width: 400,
                      height: 50,
                      // color: kPrimaryColor,
                      decoration: BoxDecoration(
                          border: Border.all(color: kPrimaryColor, width: 2)),

                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: DropdownButton<String>(
                          value: selectedStatus,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedStatus = newValue!;
                            });
                          },
                          isExpanded: true,
                          style: TextStyle(
                              color: kColor4,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          icon: Icon(Icons.arrow_drop_down, color: kColor4),
                          iconSize: 25,
                          elevation: 16,
                          underline: Container(
                            height: 0,
                            color: Colors.transparent,
                          ),
                          items: <String>[
                            S.of(context).New,
                            S.of(context).Preparing,
                            S.of(context).Delivering,
                            S.of(context).Received
                          ].map<DropdownMenuItem<String>>((String? value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value ??
                                    'Select Status', // Provide a default value or message
                                style: TextStyle(fontSize: 16.0),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 28),
                    child: Container(
                      width: 400,
                      height: 50,
                      // color: kPrimaryColor,
                      decoration: BoxDecoration(
                          border: Border.all(color: kPrimaryColor, width: 2)),

                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: DropdownButton<String>(
                          value: selectedPaidStatus,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedPaidStatus = newValue;
                            });
                          },
                          isExpanded: true,
                          style: TextStyle(
                              color: kColor4,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          icon: Icon(Icons.arrow_drop_down, color: kColor4),
                          iconSize: 25,
                          elevation: 16,
                          underline: Container(
                            height: 0,
                            color: Colors.transparent,
                          ),
                          items: <String>[
                            S.of(context).Paid,
                            S.of(context).Un_Paid
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    // CustomTextField(
                    //   labelText: S.of(context).Paid_Status,
                    //   onChanged: (value) {
                    //     widget.paid_status = value;
                    //   },
                    // ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                      onTap: () {
                        BlocProvider.of<AllApiCubit>(context).updateCart(
                            context: context,
                            status: selectedStatus,
                            paid_status: selectedPaidStatus,
                            id: widget.index!);
                      },
                      text: S.of(context).Edit,
                      width: 100,
                      borderRadius: 8,
                      padding: 8,
                      height: 40),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            )));
  }
}
