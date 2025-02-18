import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/core/language/language_constants.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  final List policyTitles = [];

  final List policyTexts = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    policyTitles.add(translation(context).overview);
    policyTitles.add(translation(context).informationCollected);
    policyTitles.add(translation(context).useOfInformation);
    policyTitles.add(translation(context).disclosureOfInformation);
    policyTitles.add(translation(context).security);
    policyTitles.add(translation(context).yourRights);
    policyTitles.add(translation(context).changesToThePrivacyPolicy);
    policyTitles.add(translation(context).contactInformation);

    policyTexts.add(translation(context).arbuzMarketcomRespectsYour);
    policyTexts.add(translation(context).personalInformationWeMay);
    policyTexts.add(translation(context).weUseTheCollected);
    policyTexts.add(translation(context).weDoNotShareYourPersonal);
    policyTexts.add(translation(context).weImplementStrict);
    policyTexts.add(translation(context).youHaveTheRight);
    policyTexts.add(translation(context).weMayReviseThis);
    policyTexts.add(translation(context).ifYouHaveAnyQuestions);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        surfaceTintColor: AppColors.transparent,
        backgroundColor: AppColors.white,
        elevation: 2,
        shadowColor: AppColors.appBarShadowColor,
        title: Text(
          translation(context).privacyPolicy,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        child: ListView.builder(
          itemCount: policyTitles.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                index == 0
                    ? Text(
                        translation(context).privacyPolicyFor,
                      )
                    : const SizedBox.shrink(),
                const SizedBox(height: 15),
                Text(
                  policyTitles[index],
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  policyTexts[index],
                  style: const TextStyle(fontWeight: FontWeight.w100),
                ),
                const SizedBox(height: 15)
              ],
            );
          },
        ),
      ),
    );
  }
}
