import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:repomed/Views/categories_view.dart';
import 'package:repomed/Views/medicine_details_view.dart';
import 'package:repomed/Views/all_carts_view.dart';
import 'package:repomed/Views/orders_view.dart';
import 'package:repomed/Views/start_page.dart';
import 'package:repomed/Views/update_cart_view.dart';
import 'package:repomed/cubits/all_api_cubit/all_api_cubit.dart';
import 'package:repomed/cubits/language_cubit/language_cubit.dart';
import 'Views/add_medicine_view.dart';
import 'Views/medicine_category_view.dart';
import 'Views/all_medicine_details_view.dart';
import 'Views/home_view.dart';
import 'Views/login_view.dart';
import 'Views/all_medicine_view.dart';
import 'cubits/auth_cubit/auth_cubit.dart';
import 'generated/l10n.dart';

void main() {
  runApp(RepoMedApp());
}

class RepoMedApp extends StatelessWidget {
  static Locale local = Locale('ar');
  RepoMedApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => AllApiCubit()),
        BlocProvider(create: (context) => LanguageCubit()),
      ],
      child: MaterialApp(
        routes: {
          LoginView.id: (context) => LoginView(),
          HomeView.id: (context) => HomeView(),
          GetStarted.id: (context) => GetStarted(),
          AddMedicineView.id: (context) => AddMedicineView(),
          AllMedicineView.id: (context) => AllMedicineView(),
          CategoriesView.id: (context) => CategoriesView(),
          AllCartsView.id: (context) => AllCartsView(),
          OrdersView.id: (context) => OrdersView(),
          AllMedicineDetails.id: (context) => AllMedicineDetails(),
          CategoryMedicines.id: (context) => CategoryMedicines(),
          MedicineDetailsView.id: (context) => MedicineDetailsView(),
          UpdateCartView.id: (context) => UpdateCartView(),
        },

        locale: local, //Locale('en'),

        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [Locale('en'), Locale('ar')],
        localeListResolutionCallback: (deviceLocale, supportedLocals) {
          if (deviceLocale != null) {
            // return deviceLocale;
          }
          return null;
        },

        debugShowCheckedModeBanner: false,
        title: 'RepoMed',
        initialRoute: LoginView.id,
      ),
    );
  }
}

class ListMenu extends StatelessWidget {
  const ListMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
