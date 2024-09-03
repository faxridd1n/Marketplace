import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/AppIconsPath.dart';
import 'package:flutter_application_1/core/constants/AppColors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  // ExpansionTileController controller1 = ExpansionTileController();
  // ExpansionTileController controller2 = ExpansionTileController();
  // ExpansionTileController controller3 = ExpansionTileController();
  // ExpansionTileController controller4 = ExpansionTileController();
  // ExpansionTileController controller5 = ExpansionTileController();
  // ExpansionTileController controller6 = ExpansionTileController();

  List categoryName = [
    'Quyosh elektr stansiyasi',
    'Suv isitish kollektori',
    'Shamol elektor stansiyasi',
    'Issiq havo nasoslari',
    'Yoqilg\'i mahsulotlari',
    'Romlar'
  ];

  List categoryIcons = [
    AppIcons.category1,
    AppIcons.category2,
    AppIcons.category3,
    AppIcons.category4,
    AppIcons.category5,
    AppIcons.category6,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: categoryName.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ExpansionTile(
                    shape: Border.all(color: Colors.transparent),
                    iconColor: AppColors.green,
                    leading: SvgPicture.asset(categoryIcons[index]),
                    title: Text(categoryName[index]),
                    children: <Widget>[
                      ListTile(
                        leading: SizedBox(),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(
                              height: 1,
                              color: AppColors.green,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(categoryName[index]),
                          ],
                        ),
                      ),
                      ListTile(
                          leading: SizedBox(),
                          title: Text(categoryName[index])),
                      ListTile(
                          leading: SizedBox(),
                          title: Text(categoryName[index])),
                      ListTile(
                          leading: SizedBox(),
                          title: Text(categoryName[index])),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
