import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:repomed/Views/get_started.dart';
import 'package:repomed/cubits/all_api_cubit/all_api_cubit.dart';

import 'package:repomed/testimage.dart';
import 'package:repomed/widgets/left_slide.dart';
import 'package:repomed/widgets/custome_card.dart';
import 'package:repomed/widgets/textFiledPickedDate.dart';

import 'Views/add_medicine_view.dart';
import 'Views/details_view.dart';
import 'Views/home_view.dart';
import 'Views/login_view.dart';
import 'Views/all_medicine_view.dart';
import 'constants.dart';
import 'cubits/auth_cubit/auth_cubit.dart';

void main() {
  runApp(RepoMedApp());
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
        },
        debugShowCheckedModeBanner: false,
        title: 'RepoMed',
        home: HomeView(),
      ),
    );
  }
}
