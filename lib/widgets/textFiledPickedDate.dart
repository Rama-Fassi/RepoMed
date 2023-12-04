import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

class TextFiledPickedDate extends StatefulWidget {
  TextFiledPickedDate({super.key, this.onChanged});
  Function(String)? onChanged;

  @override
  State<StatefulWidget> createState() {
    return _TextFiledPickedDate();
  }
}

class _TextFiledPickedDate extends State<TextFiledPickedDate> {
  TextEditingController dateinput = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: TextFiledPickedDate().onChanged,
      controller: dateinput, //editing controller of this TextField
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        suffixIcon: const Icon(
          Icons.calendar_today,
          color: kLogoColor1,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        labelText: 'Enter Expiration Date', //label text of field
        alignLabelWithHint: true,
        labelStyle:
            const TextStyle(color: kColor4, fontWeight: FontWeight.bold),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: kLogoColor1,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          // borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: kColor5,
          ),
          // ),
        ),
      ),
      readOnly: true, //set it true, so that user will not able to edit text
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: kLogoColor2, // header background color
                  onPrimary: Colors.white, // header text color
                  onSurface: kLogoColor1, // body text color
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red, // button text color
                  ),
                ),
              ),
              child: child!,
            );
          },
        );

        if (pickedDate != null) {
          print(pickedDate); //pickedDate output format
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          print(formattedDate); //formatted date output using intl package
          //you can implement different kind of Date Format here according to your requirement

          setState(() {
            dateinput.text =
                formattedDate; //set output date to TextField value.
          });
        } else {
          print("Date is not selected");
        }
      },
    );
  }
}
