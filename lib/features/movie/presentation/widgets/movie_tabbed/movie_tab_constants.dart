import 'package:movies/config/common/constants/translation_constants.dart';
import 'package:movies/features/movie/domain/entities/tab_entity.dart';

class MovieTabConstants {
  static const List<TabEntity> movieTabs = [
    TabEntity(index: 0, title: TranslationConstants.popular),
    TabEntity(index: 1, title: TranslationConstants.now),
    TabEntity(index: 2, title: TranslationConstants.soon),
  ];
}
