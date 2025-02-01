import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/review_models/products_get_review_response_model.dart';
import 'package:flutter_application_1/screens/product_detail/product_detail_bloc/product_detail_bloc.dart';
import 'package:flutter_application_1/user_auth_bloc/user_auth_state.dart';
import 'package:flutter_application_1/widgets/login_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/language/language_constants.dart';
import '../../../models/product_detail_model/product_detail_model.dart';
import '../../../user_auth_bloc/user_auth_bloc.dart';
import '../../review/review_page.dart';

class ReviewSection extends StatefulWidget {
  const ReviewSection(
      {required this.productDetailModel,
      // required this.authStatus,
      required this.productsGetReviewResponseModel,
      super.key});
  final ProductDetailModel productDetailModel;
  // final AuthStatus authStatus;
  final ProductsGetReviewResponseModel productsGetReviewResponseModel;
  @override
  State<ReviewSection> createState() => _ReviewSectionState();
}

class _ReviewSectionState extends State<ReviewSection> {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            translation(context).reviews,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: translation(context).yourReview,
              style: const TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '(${translation(context).inModeration})',
                  style: const TextStyle(
                    color: AppColors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              RatingBar.builder(
                unratedColor: AppColors.grey3,
                itemCount: 5,
                itemSize: 30,
                initialRating: widget
                    .productsGetReviewResponseModel.result.items[0].rating
                    .toDouble(),
                itemPadding:
                    const EdgeInsets.symmetric(horizontal: 1, vertical: 15),
                itemBuilder: (context, index) {
                  return const Icon(
                    Icons.star_rate_rounded,
                    color: AppColors.yellow,
                  );
                },
                onRatingUpdate: (rating) {},
              ),
              const SizedBox(width: 5),
              Text(
                widget.productsGetReviewResponseModel.result.items[0].rating
                    .toString(),
                style: const TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 15),
              Text(
                '${widget.productsGetReviewResponseModel.result.items[0].date.substring(0, 10)} ${widget.productsGetReviewResponseModel.result.items[0].date.substring(11, 16)}',
                style: const TextStyle(
                  color: AppColors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            widget.productsGetReviewResponseModel.result.items[0].content,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          const Divider(
            thickness: 0.5,
            color: AppColors.grey2,
          ),
          const SizedBox(height: 10),
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
                      Navigator.of(context).push(
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
