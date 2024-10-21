import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/drawer/drawer_pages/drawer_pages_widgets/DocsWidget.dart';
import '../../../core/constants/app_colors.dart';
import '../../../widgets/bottom_info_widget.dart';

class NormativeDocsPage extends StatefulWidget {
  const NormativeDocsPage({super.key});

  @override
  State<NormativeDocsPage> createState() => _NormativeDocsPageState();
}

class _NormativeDocsPageState extends State<NormativeDocsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:AppColors.white,
        title: const Text(
          'Me\'yoriy hujjatlar',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      backgroundColor:AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 20,
              ),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder:(context, index) {
                return const DocsWidget();
              },),
            ),
            const BottomInfoWidget()
          ],
        ),
      ),
    );
  }
}
