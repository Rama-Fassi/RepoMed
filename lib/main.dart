import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repomed/Views/categories_view.dart';
import 'package:repomed/Views/start_page.dart';
import 'package:repomed/cubits/all_api_cubit/all_api_cubit.dart';
import 'Views/add_medicine_view.dart';
import 'widgets/details_table.dart';
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
          HomeView.id: (context) => HomeView(),
          GetStarted.id: (context) => GetStarted(),
          AddMedicineView.id: (context) => AddMedicineView(),
          AllMedicineView.id: (context) => AllMedicineView(),
          TableWidget.id: (context) => TableWidget(),
          LoginView.id: (context) => LoginView(),
          CategoriesView.id: (context) => CategoriesView(),
        },
        debugShowCheckedModeBanner: false,
        title: 'RepoMed',
        initialRoute: LoginView.id,
      ),
    );
  }
}
