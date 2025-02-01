import 'package:flutter_application_1/assets_path/app_icons_path.dart';

class Language {
  final int id;
  final String flag;
  final String name;
  final String languageCode;
  Language(this.id, this.flag, this.name, this.languageCode);
  static List<Language> languageList() {
    return <Language>[
      Language(1, AppIcons.languageEn, "English", "en"),
      Language(2, AppIcons.languageRu, "Русский", "ru"),
    ];
  }
}
