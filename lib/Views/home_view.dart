import 'package:flutter/material.dart';
import 'package:repomed/Views/get_started.dart';
import 'package:repomed/widgets/custom_button.dart';
import '../constants.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 900) {
          // If the screen width is greater than 600 pixels, display a two-column layout
          return Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              elevation: 0.0,
            ),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                kSizedBox,
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Manage Your',
                        style: TextStyle(
                            fontSize: 70,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade900),
                      ),
                      Text(
                        'RepoMed',
                        style: TextStyle(
                            fontSize: 70,
                            fontWeight: FontWeight.bold,
                            color: kLogoColor1),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      CustomButton(
                        text: 'Get Started',
                        width: 300,
                        borderRadius: 80,
                        onTap: () {
                          Navigator.pushNamed(context, GetStarted.id);
                        },
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: 1000,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/img_3.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          // If the screen width is 600 pixels or less, display a single-column layout
          return Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              elevation: 0.0,
            ),
            body: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Manage Your',
                        style: TextStyle(
                            fontSize: 70,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade900),
                      ),
                      Text(
                        'RepoMed',
                        style: TextStyle(
                            fontSize: 70,
                            fontWeight: FontWeight.bold,
                            color: kLogoColor1),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      CustomButton(
                        text: 'Get Started',
                        width: 300,
                        borderRadius: 80,
                        onTap: () {
                          Navigator.pushNamed(context, GetStarted.id);
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
