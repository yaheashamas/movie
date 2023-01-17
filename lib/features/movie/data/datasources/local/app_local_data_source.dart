import 'package:hive/hive.dart';

abstract class AppLocalDataSource {
  Future<void> updateLanguage(String language);
  Future<String> getPreferLangugae();
}

class AppLocalDataSrouceImpl extends AppLocalDataSource {
  final nameDB = "langugae";
  final keyLang = "lang";

  @override
  Future<String> getPreferLangugae() async {
    final db = await Hive.openBox(nameDB);
    return db.get(keyLang) ?? 'en';
  }

  @override
  Future<void> updateLanguage(String language) async {
    final db = await Hive.openBox(nameDB);
    db.put(keyLang, language);
  }
}
