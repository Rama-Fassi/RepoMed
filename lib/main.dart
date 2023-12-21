import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repomed/Views/categories_view.dart';
import 'package:repomed/Views/medicine_details_view.dart';
import 'package:repomed/Views/orders_view.dart';
import 'package:repomed/Views/start_page.dart';
import 'package:repomed/cubits/all_api_cubit/all_api_cubit.dart';
import 'Views/add_medicine_view.dart';
import 'Views/medicine_category_view.dart';
import 'Views/all_medicine_details_view.dart';
import 'Views/home_view.dart';
import 'Views/login_view.dart';
import 'Views/all_medicine_view.dart';
import 'cubits/auth_cubit/auth_cubit.dart';

void main() {
  runApp(const RepoMedApp());
}

class RepoMedApp extends StatelessWidget {
  const RepoMedApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => AllApiCubit()),
      ],
      child: MaterialApp(
        routes: {
          LoginView.id: (context) => LoginView(),
          HomeView.id: (context) => HomeView(),
          GetStarted.id: (context) => GetStarted(),
          AddMedicineView.id: (context) => AddMedicineView(),
          AllMedicineView.id: (context) => AllMedicineView(),
          CategoriesView.id: (context) => CategoriesView(),
          AllOrdersView.id: (context) => AllOrdersView(),
          AllMedicineDetails.id: (context) => AllMedicineDetails(),
          Medicines.id: (context) => Medicines(),
          MedicineDetailsView.id: (context) => MedicineDetailsView(),
        },
        debugShowCheckedModeBanner: false,
        title: 'RepoMed',
        initialRoute: LoginView.id,
      ),
    );
  }
}
