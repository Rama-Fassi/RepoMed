import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:repomed/constants.dart';

import 'details_table.dart';

class CustomeCard extends StatelessWidget {
  const CustomeCard({Key? key, required this.medicineName}) : super(key: key);
  final String medicineName;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 250,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            blurRadius: 40,
            color: Colors.grey.withOpacity(.1),
            spreadRadius: 0,
            offset: Offset(10, 10),
          ),
        ]),
        child: Card(
          elevation: 5,
          color: Colors.grey.shade50,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 7,
                  child: Center(
                    child: Container(
                      child: Image.asset(
                        'assets/images/4.png',
                        width: 200,
                        height: 140,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    medicineName,
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 8,
                // ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, TableWidget.id);
                        },
                        child: Text(
                          'Details',
                          style: TextStyle(color: kPrimaryColor),
                        ),
                      ),
                      Icon(
                        FontAwesomeIcons.capsules,
                        color: kPrimaryColor,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Center(
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           Container(
//             width: 300,
//             height: 250,
//             decoration: BoxDecoration(boxShadow: [
//               BoxShadow(
//                 blurRadius: 30,
//                 color: Colors.grey.withOpacity(.2),
//                 spreadRadius: 0,
//                 offset: Offset(10, 10),
//               ),
//             ]),
//             child: Card(
//               elevation: 10,
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Text(
//                       'data',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 50,
//                       ),
//                     ),
//                     // SizedBox(
//                     //   height: 5,
//                     // ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           r'$225',
//                           style: TextStyle(fontSize: 30),
//                         ),
//                         Icon(
//                           Icons.favorite,
//                           color: Colors.red,
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             child: Image.asset(
//               'assets/images/backgrounds/background1.jpg',
//               width: 50,
//             ),
//           )
//         ],
//       ),
//     );
