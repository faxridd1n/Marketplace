import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/app_images_path.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import '../../../widgets/bottom_info_widget.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:AppColors.white,
        
      ),
      backgroundColor:AppColors.white,
      body: SingleChildScrollView(
              child: Column(
      children: [
        Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppImages.topBg,
                ),
                fit: BoxFit.cover,
              ),
            ),
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: const Center(
              child: Text(
                'Biz haqimizda',
                style: TextStyle(
                  color:AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Image.asset(
                    AppImages.gerb1,
                    width: 65,
                    height: 65,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'O\'ZBEKISTON RESPUBLIKASI\nENERGETIKA VAZIRLIGI HUZURIDAGI\nBUDJETDAN TASHQARI TARMOQLARARO\nENERGIYANI TEJASH JAMG\'ARMASI',
                    style: TextStyle(
                      color: AppColors.blueText,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'O‘zbekiston Respublikasi Energetika vazirligi huzuridagi budjetdan tashqari Tarmoqlararo energiyani tejash jamg‘armasi (keyingi o‘rinlarda — Jamg‘arma) o‘z faoliyatida O‘zbekiston Respublikasi Konstitutsiyasi va qonunlariga, O‘zbekiston Respublikasi Oliy Majlisi palatalarining qarorlariga, O‘zbekiston Respublikasi Prezidentining farmonlari, qarorlari va farmoyishlariga, Vazirlar Mahkamasining qarorlari va farmoyishlariga, shuningdek, ushbu Nizomga va boshqa normativ-huquqiy hujjatlarga amal qiladi. Jamg‘arma davlat muassasasi shaklidagi yuridik shaxs hisoblanadi, o‘z mustaqil balansiga, bank hisobvaraqlariga, O‘zbekiston Respublikasi Davlat gerbi tasviri tushirilgan va o‘z nomi davlat tilida yozilgan muhriga ega',
                style: TextStyle(
                  color: AppColors.grey2,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 20,
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                AppImages.panelBig,
              ),
              const SizedBox(
                height: 10,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 70,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: AppColors.grey4,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                        height: 120,
                        child: const Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            'Yunusobod tumani, Chingiz Aytmatov ko‘chasi, 2B.',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 3,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                      top: 5,
                      child: Image.asset(
                        AppImages.locationBig,
                        fit: BoxFit.cover,
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 70,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: AppColors.grey4,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 20,
                        ),
                        height: 120,
                        child: const Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Ishonch raqami:',
                                style: TextStyle(
                                  color: AppColors.grey2,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '+998 (77) 070-12-32',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 3,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                      top: 5,
                      child: Image.asset(
                        AppImages.phoneBig,
                        fit: BoxFit.cover,
                      ))
                ],
              ),
              const SizedBox(
                height:20,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 70,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: AppColors.grey4,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 20,
                        ),
                        height: 120,
                        child: const Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Pochta manzili:',
                                style: TextStyle(
                                  color: AppColors.grey2,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'info@iesf.uz',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                      top: 5,
                      child: Image.asset(
                        AppImages.mailBig,
                        fit: BoxFit.cover,
                      ))
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 30,),
        const BottomInfoWidget(),
      ],
              ),
            ),
    );
  }
}
