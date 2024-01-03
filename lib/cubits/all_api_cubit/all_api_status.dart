part of 'all_api_cubit.dart';

@immutable
sealed class AllApiState {}

final class AllApiInitial extends AllApiState {}

final class AllApiLoading extends AllApiState {}

final class AllApiSuccess extends AllApiState {}

final class AllApiFailur extends AllApiState {
  final String errMessage;
  AllApiFailur(this.errMessage);
}

final class AllCategoriesLoading extends AllApiState {}

final class AllCategoriesSuccess extends AllApiState {}

final class AllCategoriesFailur extends AllApiState {
  final String errMessage;
  AllCategoriesFailur(this.errMessage);
}

final class AddCategoryLoading extends AllApiState {}

final class AddCategorySuccess extends AllApiState {}

final class AddCategoryFailure extends AllApiState {
  final String errMessage;
  AddCategoryFailure(this.errMessage);
}

final class MedicineLoading extends AllApiState {}

final class MedicineSuccess extends AllApiState {}

final class MedicineFailure extends AllApiState {
  final String errMessage;
  MedicineFailure(this.errMessage);
}

final class AllMedicineLoading extends AllApiState {}

final class AllMedicineSuccess extends AllApiState {}

final class AllMedicineFailure extends AllApiState {
  final String errMessage;
  AllMedicineFailure(this.errMessage);
}

final class AllMedicineDetailsLoading extends AllApiState {}

final class AllMedicineDetailsSuccess extends AllApiState {}

final class AllMedicineDetailsFailur extends AllApiState {
  final String errMessage;
  AllMedicineDetailsFailur(this.errMessage);
}

final class AddMedicineLoading extends AllApiState {}

final class AddMedicineSuccess extends AllApiState {}

final class AddMedicineFailure extends AllApiState {
  final String errMessage;
  AddMedicineFailure(this.errMessage);
}

final class AllCartsLoading extends AllApiState {}

final class AllCartsSuccess extends AllApiState {}

final class AllCartsFailure extends AllApiState {
  final String errMessage;
  AllCartsFailure(this.errMessage);
}

final class ShowCartLoading extends AllApiState {}

final class ShowCartSuccess extends AllApiState {}

final class ShowCartFailure extends AllApiState {
  final String errMessage;
  ShowCartFailure(this.errMessage);
}

final class AllOrdersLoading extends AllApiState {}

final class AllOdersSuccess extends AllApiState {}

final class AllOrdersFailure extends AllApiState {
  final String errMessage;
  AllOrdersFailure(this.errMessage);
}

final class UpdateCartLoading extends AllApiState {}

final class UpdateCartSuccess extends AllApiState {}

final class UpdateCartFailure extends AllApiState {
  final String errMessage;
  UpdateCartFailure(this.errMessage);
}

final class AllSalesReportLoading extends AllApiState {}

final class AllSalesReportSuccess extends AllApiState {}

final class AllSalesReportFailure extends AllApiState {
  late final String errMessage;
  AllSalesReportFailure(this.errMessage);
}

final class AllUsersReportLoading extends AllApiState {}

final class AllUsersReportSuccess extends AllApiState {}

final class AllUsersReportFailure extends AllApiState {
  late final String errMessage;
  AllUsersReportFailure(this.errMessage);
}
