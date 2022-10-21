part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ToggleLanguageEvent extends LanguageEvent {
  final LanguageEntity language;
  ToggleLanguageEvent(this.language);
  @override
  List<Object> get props => [language.code];
}
