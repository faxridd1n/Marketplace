import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/app_images_path.dart';
import 'package:flutter_application_1/user_auth_bloc/user_auth_state.dart';
import 'package:flutter_application_1/widgets/login_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/language/language_constants.dart';
import '../../../models/product_detail_model/product_detail_model.dart';
import '../../../user_auth_bloc/user_auth_bloc.dart';
import '../../review/review_page.dart';
import '../product_detail_bloc/product_detail_bloc.dart';

class EmptyReviewSection extends StatefulWidget {
  const EmptyReviewSection({
    required this.productDetailModel,
    super.key,
  });
  final ProductDetailModel productDetailModel;
  @override
  State<EmptyReviewSection> createState() => _EmptyReviewSectionState();
}

class _EmptyReviewSectionState extends State<EmptyReviewSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 120,
            child: Image.asset(
              AppImages.emptyReview,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            translation(context).beTheFirstToLeaveAReview,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: AppColors.green,
                  ),
                  onPressed: () {
                    if (context
                            .read<AuthenticationBloc>()
                            .state
                            .userAuthStatus ==
                        AuthStatus.authenticated) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => BlocProvider.value(
                            value: context.read<ProductDetailBloc>(),
                            child: ReviewPage(
                              productDetailModel: widget.productDetailModel,
                            ),
                          ),
                        ),
                      );
                    } else {
                      loginDiolog(context, () {
                        setState(() {});
                      });
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 5,
                    ),
                    child: Text(
                      translation(context).addAReview,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
