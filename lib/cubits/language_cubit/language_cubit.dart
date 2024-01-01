import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  static LanguageCubit get(context) => BlocProvider.of(context);

  LanguageCubit() : super(LanguageInitial());

  changLanguage(String? lang) {
    if (lang == "ar")
      emit(ArabicLanguage());
    else {
      emit(EnglishLanguage());
    }
  }
}
