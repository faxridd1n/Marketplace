import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home/drawer/drawer_pages/drawer_pages_widgets/DocsWidget.dart';
import 'package:flutter_application_1/screens/home/widgets/BottomCardWidget.dart';

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
        backgroundColor: Colors.white,
        title: Text(
          'Me\'yoriy hujjatlar',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 20,
              ),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder:(context, index) {
                return DocsWidget();
              },),
            ),
            BottomInfoWidget()
          ],
        ),
      ),
    );
  }
}
