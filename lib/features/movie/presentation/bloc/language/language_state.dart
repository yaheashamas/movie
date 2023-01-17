import 'dart:ui';
import 'package:equatable/equatable.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();
  @override
  List<Object> get props => [];
}

class LanguageLoaded extends LanguageState {
  final Locale locale;
  const LanguageLoaded(this.locale);
  @override
  List<Object> get props => [locale];
}

class LanguageError extends LanguageState {}
