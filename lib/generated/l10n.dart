// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Manage Your`
  String get Manage_Your {
    return Intl.message(
      'Manage Your',
      name: 'Manage_Your',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get Get_Started {
    return Intl.message(
      'Get Started',
      name: 'Get_Started',
      desc: '',
      args: [],
    );
  }

  /// `Add Medicine`
  String get add_Medicine {
    return Intl.message(
      'Add Medicine',
      name: 'add_Medicine',
      desc: '',
      args: [],
    );
  }

  /// `All Medicines`
  String get All_Medicines {
    return Intl.message(
      'All Medicines',
      name: 'All_Medicines',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get Categories {
    return Intl.message(
      'Categories',
      name: 'Categories',
      desc: '',
      args: [],
    );
  }

  /// `All Carts`
  String get All_Carts {
    return Intl.message(
      'All Carts',
      name: 'All_Carts',
      desc: '',
      args: [],
    );
  }

  /// `Reports`
  String get Reports {
    return Intl.message(
      'Reports',
      name: 'Reports',
      desc: '',
      args: [],
    );
  }

  /// `Medicines details`
  String get Medicines_details {
    return Intl.message(
      'Medicines details',
      name: 'Medicines_details',
      desc: '',
      args: [],
    );
  }

  /// `RepoMed`
  String get RepoMed {
    return Intl.message(
      'RepoMed',
      name: 'RepoMed',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get Home {
    return Intl.message(
      'Home',
      name: 'Home',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get Log_out {
    return Intl.message(
      'Log out',
      name: 'Log_out',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get Settings {
    return Intl.message(
      'Settings',
      name: 'Settings',
      desc: '',
      args: [],
    );
  }

  /// `Enter The Medicine Details`
  String get Enter_The_Medicine_Details {
    return Intl.message(
      'Enter The Medicine Details',
      name: 'Enter_The_Medicine_Details',
      desc: '',
      args: [],
    );
  }

  /// `Scientific Name`
  String get Scientific_Name {
    return Intl.message(
      'Scientific Name',
      name: 'Scientific_Name',
      desc: '',
      args: [],
    );
  }

  /// `Trade Name`
  String get Trade_Name {
    return Intl.message(
      'Trade Name',
      name: 'Trade_Name',
      desc: '',
      args: [],
    );
  }

  /// `Medicine Category`
  String get Medicine_Category {
    return Intl.message(
      'Medicine Category',
      name: 'Medicine_Category',
      desc: '',
      args: [],
    );
  }

  /// `The Manufacture Company`
  String get The_Manufacture_Company {
    return Intl.message(
      'The Manufacture Company',
      name: 'The_Manufacture_Company',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get Quantity {
    return Intl.message(
      'Quantity',
      name: 'Quantity',
      desc: '',
      args: [],
    );
  }

  /// `expiration time`
  String get expiration_time {
    return Intl.message(
      'expiration time',
      name: 'expiration_time',
      desc: '',
      args: [],
    );
  }

  /// `The Price`
  String get The_Price {
    return Intl.message(
      'The Price',
      name: 'The_Price',
      desc: '',
      args: [],
    );
  }

  /// `Form`
  String get Form {
    return Intl.message(
      'Form',
      name: 'Form',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get Details {
    return Intl.message(
      'Details',
      name: 'Details',
      desc: '',
      args: [],
    );
  }

  /// `Add Medicine`
  String get Add_Medicine {
    return Intl.message(
      'Add Medicine',
      name: 'Add_Medicine',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get Details1 {
    return Intl.message(
      'Details',
      name: 'Details1',
      desc: '',
      args: [],
    );
  }

  /// `Add New Category`
  String get Add_New_Category {
    return Intl.message(
      'Add New Category',
      name: 'Add_New_Category',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get Add {
    return Intl.message(
      'Add',
      name: 'Add',
      desc: '',
      args: [],
    );
  }

  /// `All Carts details`
  String get All_Carts_details {
    return Intl.message(
      'All Carts details',
      name: 'All_Carts_details',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get Cart {
    return Intl.message(
      'Cart',
      name: 'Cart',
      desc: '',
      args: [],
    );
  }

  /// `User_id`
  String get User_id {
    return Intl.message(
      'User_id',
      name: 'User_id',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get Status {
    return Intl.message(
      'Status',
      name: 'Status',
      desc: '',
      args: [],
    );
  }

  /// `Paid Status`
  String get Paid_Status {
    return Intl.message(
      'Paid Status',
      name: 'Paid_Status',
      desc: '',
      args: [],
    );
  }

  /// `Created At`
  String get Created_at {
    return Intl.message(
      'Created At',
      name: 'Created_at',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get Edit {
    return Intl.message(
      'Edit',
      name: 'Edit',
      desc: '',
      args: [],
    );
  }

  /// `details`
  String get details3 {
    return Intl.message(
      'details',
      name: 'details3',
      desc: '',
      args: [],
    );
  }

  /// `All Orders`
  String get All_Orders {
    return Intl.message(
      'All Orders',
      name: 'All_Orders',
      desc: '',
      args: [],
    );
  }

  /// `Order_id`
  String get Order_id {
    return Intl.message(
      'Order_id',
      name: 'Order_id',
      desc: '',
      args: [],
    );
  }

  /// `Cart_id`
  String get Cart_id {
    return Intl.message(
      'Cart_id',
      name: 'Cart_id',
      desc: '',
      args: [],
    );
  }

  /// `Medicine`
  String get Medicine {
    return Intl.message(
      'Medicine',
      name: 'Medicine',
      desc: '',
      args: [],
    );
  }

  /// `Edit Carts`
  String get Edit_Carts {
    return Intl.message(
      'Edit Carts',
      name: 'Edit_Carts',
      desc: '',
      args: [],
    );
  }

  /// `Cart Update Successfully`
  String get Cart_Update_Successfully {
    return Intl.message(
      'Cart Update Successfully',
      name: 'Cart_Update_Successfully',
      desc: '',
      args: [],
    );
  }

  /// `Medicine Added Successfully!`
  String get Medicine_Added_Successfully {
    return Intl.message(
      'Medicine Added Successfully!',
      name: 'Medicine_Added_Successfully',
      desc: '',
      args: [],
    );
  }

  /// `Category Added Successfully!`
  String get Category_Added_Successfully {
    return Intl.message(
      'Category Added Successfully!',
      name: 'Category_Added_Successfully',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get Login {
    return Intl.message(
      'Login',
      name: 'Login',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message(
      'Email',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `Medicine Details:`
  String get Medicine_Details {
    return Intl.message(
      'Medicine Details:',
      name: 'Medicine_Details',
      desc: '',
      args: [],
    );
  }

  /// `description`
  String get description {
    return Intl.message(
      'description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get Delete {
    return Intl.message(
      'Delete',
      name: 'Delete',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get New {
    return Intl.message(
      'New',
      name: 'New',
      desc: '',
      args: [],
    );
  }

  /// `Preparing`
  String get Preparing {
    return Intl.message(
      'Preparing',
      name: 'Preparing',
      desc: '',
      args: [],
    );
  }

  /// `Delivering`
  String get Delivering {
    return Intl.message(
      'Delivering',
      name: 'Delivering',
      desc: '',
      args: [],
    );
  }

  /// `Received`
  String get Received {
    return Intl.message(
      'Received',
      name: 'Received',
      desc: '',
      args: [],
    );
  }

  /// `Paid`
  String get Paid {
    return Intl.message(
      'Paid',
      name: 'Paid',
      desc: '',
      args: [],
    );
  }

  /// `Un Paid`
  String get Un_Paid {
    return Intl.message(
      'Un Paid',
      name: 'Un_Paid',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
