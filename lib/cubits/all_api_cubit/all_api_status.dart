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
