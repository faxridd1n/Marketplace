import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/app_icons_path.dart';
import 'package:flutter_application_1/core/language/language.dart';
import 'package:flutter_application_1/core/language/language_constants.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/app_colors.dart';

class HomeLanguageChangeDropDownWidget extends StatefulWidget {
  final bool isLanguagePopUp;

  const HomeLanguageChangeDropDownWidget({
    required this.isLanguagePopUp,
    super.key,
  });

  @override
  State<HomeLanguageChangeDropDownWidget> createState() =>
      _HomeLanguageChangeDropDownWidgetState();
}

class _HomeLanguageChangeDropDownWidgetState
    extends State<HomeLanguageChangeDropDownWidget> {
  late Language selectedLanguage;
  List<String> lanuages = ['en', 'ru'];

  @override
  void initState() {
    super.initState();
    selectedLanguage = Language(0, AppIcons.languageEn, 'English', 'en');
    _initializeLanguage();
  }

  Future<void> _initializeLanguage() async {
    final initial = await getLocale();

    setState(() {
      selectedLanguage = Language(
        initial.languageCode == lanuages[0] ? 0 : 1,
        initial.languageCode == lanuages[0]
            ? AppIcons.languageEn
            : AppIcons.languageRu,
        initial.languageCode == lanuages[0] ? 'English' : 'Русский',
        initial.languageCode,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final languages = Language.languageList();

    return PopupMenuButton<Language>(
      color: AppColors.white,
      elevation: 5,
      constraints: const BoxConstraints.tightFor(width: 150),
      offset: const Offset(0, 40),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      onSelected: (Language? value) async {
        if (value != null) {
          Locale _locale = await setLocale(value.languageCode);
          MyApp.setLocale(
            context,
            _locale,
          );
          setState(() {
            selectedLanguage = value;
          });
        }
      },
      itemBuilder: (BuildContext context) {
        return languages.map((Language language) {
          return PopupMenuItem<Language>(
            padding: const EdgeInsets.only(left: 8),
            value: language,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 18,
                  width: 24,
                  child: SvgPicture.asset(language.flag),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    border:
                        language.languageCode == selectedLanguage.languageCode
                            ? const Border(
                                bottom: BorderSide(
                                  color: AppColors.black,
                                  width: 1,
                                ),
                              )
                            : null,
                  ),
                  child: Text(
                    language.name,
                    style: const TextStyle(
                      height: 1.15,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
        child: Row(
          children: [
            SizedBox(
              height: 18,
              width: 24,
              child: SvgPicture.asset(selectedLanguage.flag),
            ),
            const SizedBox(width: 8),
            Text(
              selectedLanguage.name,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
            const SizedBox(width: 15),
          ],
        ),
      ),
    );
  }
}
