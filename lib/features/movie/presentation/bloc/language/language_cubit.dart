import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/config/common/constants/languages.dart';
import 'package:movies/core/language/language_entity.dart';
import 'package:movies/features/movie/domain/usecases/local/get_preferred_use_case.dart';
import 'package:movies/features/movie/domain/usecases/local/update_language_use_case.dart';

class LanguageCubit extends Cubit<Locale> {
  static LanguageCubit get(context) => BlocProvider.of(context);
  UpdateLanguageUseCase updateLanguageUseCase;
  GetPreferredUseCase getPreferredUseCase;

  LanguageCubit(
    this.getPreferredUseCase,
    this.updateLanguageUseCase,
  ) : super(Locale(Languages.languages[0].code));

  updateLanguage(LanguageEntity language) {
    updateLanguageUseCase(language.code);
    getPreferredLanguage();
  }

  getPreferredLanguage() async {
    final lang = await getPreferredUseCase();
    emit(lang.fold(
      (l) => Locale(Languages.languages[0].code),
      (r) => Locale(r),
    ));
  }
}
