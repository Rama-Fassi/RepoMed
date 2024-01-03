import 'package:flutter/material.dart';
import 'package:repomed/constants.dart';
import 'package:repomed/models/sales_report_model.dart';
import 'package:repomed/models/users_report.dart';
import '../cubits/all_api_cubit/all_api_cubit.dart';
import '../widgets/custom_slide.dart';
import 'package:repomed/app_localizations.dart';

class AllReportsView extends StatefulWidget {
  static String id = 'ReportsView';

  @override
  _AllReportsViewState createState() => _AllReportsViewState();
}

class _AllReportsViewState extends State<AllReportsView> {
  List<SalesReportData> salesReportData = [];
  List<UsersReportData> usersReportData = [];

  @override
  Widget build(BuildContext context) {
    AllApiCubit cubit = AllApiCubit.get(context);

    if (cubit.salesReportModel?.data != null) {
      salesReportData = cubit.salesReportModel!.data!.map((salesReport) {
        return SalesReportData(
          productName: salesReport.productName,
          totalProductSales: salesReport.totalProductSales,
        );
      }).toList();
    }

    if (cubit.usersReportModel?.data != null) {
      usersReportData = cubit.usersReportModel!.data!.map((UsersReport) {
        return UsersReportData(
            userName: UsersReport.userName,
            totalUsersSales: UsersReport.totalUsersSales);
      }).toList();
    }

    return WillPopScope(
        onWillPop: () async => true,
        child: Scaffold(
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 1, child: CustomSlide()),
              Expanded(
                flex: 5,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 100, left: 100, top: 30),
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "Medicines_Report".tr(context),
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 27,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                DataTable(
                                  border: TableBorder.all(
                                      //  borderRadius: BorderRadius.circular(8),
                                      ),
                                  //   columnSpacing: 60,
                                  headingTextStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      color: kPrimaryColor),
                                  headingRowColor:
                                      MaterialStateColor.resolveWith(
                                          (states) => kLogoColor2),
                                  columns: [
                                    DataColumn(
                                      label: Text('Medicine_Name'.tr(context)),
                                      tooltip: 'Medicine_Name'.tr(context),
                                    ),
                                    DataColumn(
                                      label: Text('Total_Sales'.tr(context)),
                                      tooltip: 'Total_Sales'.tr(context),
                                    ),
                                  ],
                                  rows: salesReportData
                                      .map(
                                        (salesReport) => DataRow(
                                          cells: [
                                            DataCell(
                                              Text(
                                                salesReport.productName!,
                                                style:
                                                    TextStyle(fontSize: 16.0),
                                              ),
                                            ),
                                            DataCell(
                                              Text(
                                                ' ${salesReport.totalProductSales}',
                                                style:
                                                    TextStyle(fontSize: 16.0),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                      .toList(),
                                ),
                              ],
                            ),
                          ),
                          VerticalDivider(
                            thickness: 2,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'Users_Report'.tr(context),
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 27,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                DataTable(
                                  border: TableBorder.all(
                                      //     borderRadius: BorderRadius.circular(8),
                                      ),
                                  // columnSpacing: 100,
                                  headingTextStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      color: kPrimaryColor),
                                  headingRowColor:
                                      MaterialStateColor.resolveWith(
                                          (states) => kLogoColor2),
                                  columns: [
                                    DataColumn(
                                      label: Expanded(
                                        child: Text(
                                          'User_Name'.tr(context),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      tooltip: 'User_Name'.tr(context),
                                    ),
                                    DataColumn(
                                      label: Text('Total_Sales'.tr(context)),
                                      tooltip: 'Total_Sales'.tr(context),
                                    ),
                                  ],
                                  rows: usersReportData
                                      .map(
                                        (usersReport) => DataRow(
                                          cells: [
                                            DataCell(
                                              Text(
                                                usersReport.userName!,
                                                style:
                                                    TextStyle(fontSize: 16.0),
                                              ),
                                            ),
                                            DataCell(
                                              Text(
                                                ' ${usersReport.totalUsersSales}',
                                                style:
                                                    TextStyle(fontSize: 16.0),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                      .toList(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
