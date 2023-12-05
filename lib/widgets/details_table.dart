import 'package:flutter/material.dart';
import '../cubits/all_api_cubit/all_api_cubit.dart';
import '../models/all_medicine_model.dart';

class TableWidget extends StatefulWidget {
  static String id = 'TableWidget';

  @override
  _TableWidgetState createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  List<AllMedicineData> medicinedetails = [];

  @override
  Widget build(BuildContext context) {
    AllApiCubit cubit = AllApiCubit.get(context);
    cubit.getAllMedicine(context);

    // Update medicine list when data is available
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

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Medicine Details',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  border: TableBorder.all(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  columnSpacing: 10.0,
                  headingTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                  columns: [
                    DataColumn(
                      label: Text('Medicine id'),
                      tooltip: 'id',
                    ),
                    DataColumn(
                      label: Text('Category'),
                      tooltip: 'The category of the Medicine',
                    ),
                    DataColumn(
                      label: Text('trade Name'),
                      tooltip: 'The trade Name of the Medicine',
                    ),
                    DataColumn(
                      label: Text('scientific Name'),
                      tooltip: 'The scientific Name of the Medicine',
                    ),
                    DataColumn(
                      label: Text('Quantity'),
                      tooltip: 'The quantity of the Medicine',
                    ),
                    DataColumn(
                      label: Text('Price'),
                      tooltip: 'The price of the Medicine',
                    ),
                    DataColumn(
                      label: Text('Expiration date'),
                      tooltip: 'the Expiration date of the Medicine',
                    ),
                    DataColumn(
                      label: Text('form'),
                      tooltip: 'The form of the Medicine',
                    ),
                    DataColumn(
                      label: Text('description'),
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
    );
  }
}
