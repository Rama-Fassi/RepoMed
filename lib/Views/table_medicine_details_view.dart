import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repomed/app_localizations.dart';
import '../cubits/all_api_cubit/all_api_cubit.dart';
import '../helper/show_snack_bar.dart';
import '../models/all_medicine_model.dart';

class AllMedicineDetails extends StatefulWidget {
  static String id = 'TableWidget';

  @override
  _AllMedicineDetailsState createState() => _AllMedicineDetailsState();
}

class _AllMedicineDetailsState extends State<AllMedicineDetails> {
  List<AllMedicineData> medicinedetails = [];

  @override
  Widget build(BuildContext context) {
    AllApiCubit cubit = AllApiCubit.get(context);
    cubit.getAllMedicine(context);

    if (cubit.allMedicineModel?.data != null) {
      medicinedetails = cubit.allMedicineModel!.data!.map((medicine) {
        return AllMedicineData(
          id: medicine.id,
          scientificName: medicine.scientificName.toString(),
          tradeName: medicine.tradeName,
          companyName: medicine.companyName,
          categoriesName: medicine.categoriesName,
          quantity: medicine.quantity,
          price: medicine.price,
          form: medicine.form,
          details: medicine.details,
          expirationAt: medicine.expirationAt,
        );
      }).toList();
    }
    bool isLoading = false;
    return BlocConsumer<AllApiCubit, AllApiState>(
      listener: (context, state) {
        if (state is AllMedicineLoading) {
          isLoading = true;
        } else if (state is AllMedicineSuccess) {
          Navigator.pushNamed(context, AllMedicineDetails.id);
          isLoading = false;
        } else if (state is AllMedicineFailure) {
          showSnakbar(context, state.errMessage);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return BlurryModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'All Medicine Details'.tr(context),
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: DataTable(
                        border: TableBorder.all(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        columnSpacing: 15,
                        headingTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                        columns: [
                          DataColumn(
                            label: Text('Medicine_id'),
                            tooltip: 'id',
                          ),
                          DataColumn(
                            label: Text('Medicine_Category'.tr(context)),
                            tooltip: 'The category of the Medicine',
                          ),
                          DataColumn(
                            label: Text('Trade_Name'.tr(context)),
                            tooltip: 'The trade Name of the Medicine',
                          ),
                          DataColumn(
                            label: Text('Scientific_Name'.tr(context)),
                            tooltip: 'The scientific Name of the Medicine',
                          ),
                          DataColumn(
                            label: Text('Quantity'.tr(context)),
                            tooltip: 'The quantity of the Medicine',
                          ),
                          DataColumn(
                            label: Text('The_Price'.tr(context)),
                            tooltip: 'The price of the Medicine',
                          ),
                          DataColumn(
                            label: Text('expiration_time'.tr(context)),
                            tooltip: 'the Expiration date of the Medicine',
                          ),
                          DataColumn(
                            label: Text('Form'.tr(context)),
                            tooltip: 'The form of the Medicine',
                          ),
                          DataColumn(
                            label: Text('description'.tr(context)),
                            tooltip: 'the description of the Medicine',
                          ),
                        ],
                        rows: medicinedetails
                            .map(
                              (medicine) => DataRow(
                                cells: [
                                  DataCell(
                                    Text(
                                      medicine.id.toString(),
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      medicine.categoriesName.toString(),
                                      style: TextStyle(fontSize: 16.0),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      medicine.tradeName.toString(),
                                      style: TextStyle(fontSize: 16.0),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      medicine.scientificName.toString(),
                                      style: TextStyle(fontSize: 16.0),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      medicine.quantity.toString(),
                                      style: TextStyle(fontSize: 16.0),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      medicine.price.toString(),
                                      style: TextStyle(fontSize: 16.0),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      medicine.expirationAt.toString(),
                                      style: TextStyle(fontSize: 16.0),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      medicine.form.toString(),
                                      style: TextStyle(fontSize: 16.0),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      medicine.details.toString(),
                                      style: TextStyle(fontSize: 16.0),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
