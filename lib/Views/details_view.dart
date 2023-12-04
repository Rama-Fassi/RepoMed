import 'package:flutter/material.dart';

class Medicine {
  final String name;
  final String image;
  final int quantity;
  final DateTime expirationDate;

  Medicine({
    required this.name,
    required this.image,
    required this.quantity,
    required this.expirationDate,
  });
}

class TableWidget extends StatelessWidget {
  static String id = 'TableWidget';
  final List<Medicine> medicine = [
    Medicine(
      name: 'Medicine 1',
      image: 'assets/images/4.png',
      quantity: 5,
      expirationDate: DateTime(2023, 12, 31),
    ),
    Medicine(
      name: 'Medicine 2',
      image: 'assets/images/4.png',
      quantity: 3,
      expirationDate: DateTime(2023, 11, 15),
    ),
    Medicine(
      name: 'Medicine 2',
      image: 'assets/images/4.png',
      quantity: 3,
      expirationDate: DateTime(2023, 11, 15),
    ),
    Medicine(
      name: 'Medicine 3',
      image: 'assets/images/4.png',
      quantity: 3,
      expirationDate: DateTime(2023, 11, 15),
    ),
    Medicine(
      name: 'Medicine 4',
      image: 'assets/images/4.png',
      quantity: 4,
      expirationDate: DateTime(2023, 11, 15),
    ),
    Medicine(
      name: 'Medicine 5',
      image: 'assets/images/4.png',
      quantity: 8,
      expirationDate: DateTime(2023, 11, 15),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Medicine Details',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                border: TableBorder.all(),
                columnSpacing: 10.0, // Adjust spacing between columns
                headingTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
                columns: [
                  DataColumn(
                    label: Text('Medicine Name'),
                    tooltip: 'The name of the Medicine',
                  ),
                  DataColumn(
                    label: Text('Image'),
                    tooltip: 'Medicine Image',
                  ),
                  DataColumn(
                    label: Text('Quantity'),
                    tooltip: 'The quantity of the Medicine',
                  ),
                  DataColumn(
                    label: Text('Expiration Date'),
                    tooltip: 'The expiration date of the Medicine',
                  ),
                ],
                rows: medicine
                    .map(
                      (medicine) => DataRow(
                        cells: [
                          DataCell(
                            Text(
                              medicine.name,
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Container(
                                width: 50,
                                height: 50,
                                child: Image.asset(medicine.image),
                              ),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text(
                                medicine.quantity.toString(),
                                style: TextStyle(fontSize: 16.0),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              '${medicine.expirationDate.day}/${medicine.expirationDate.month}/${medicine.expirationDate.year}',
                              style: TextStyle(fontSize: 16.0),
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
    );
  }
}
