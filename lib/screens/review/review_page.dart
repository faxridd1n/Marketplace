import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/core/language/language_constants.dart';
import 'package:flutter_application_1/models/product_detail_model/product_detail_model.dart';
import 'package:flutter_application_1/models/review_models/post_review_request_model.dart';
import 'package:flutter_application_1/screens/product_detail/product_detail_bloc/product_detail_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:formz/formz.dart';
import '../../widgets/custom_cachedd_image.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({required this.productDetailModel, super.key});
  final ProductDetailModel productDetailModel;
  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  TextEditingController reviewController = TextEditingController();
  int givenRating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBgColor,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.transparent,
        shadowColor: AppColors.appBarShadowColor,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.white,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomCachedImage(
                      width: 90,
                      borderRadius: BorderRadius.circular(8),
                      imageUrl: widget
                          .productDetailModel.result.variations[0].files[0].url,
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        widget.productDetailModel.result.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.white,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      translation(context).yourRating,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    RatingBar.builder(
                      unratedColor: AppColors.grey3,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 15),
                      itemBuilder: (context, index) {
                        return const Icon(
                          Icons.star_rate_rounded,
                          color: AppColors.yellow,
                        );
                      },
                      onRatingUpdate: (rating) {
                        givenRating = rating.toInt();
                      },
                    ),
                    const SizedBox(height: 20),
                    Text(
                      translation(context).tellMore,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                      cursorWidth: 1.5,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      controller: reviewController,
                      maxLines: 5,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        hintText: translation(context).yourReview,
                        hintStyle: const TextStyle(
                          color: AppColors.grey2,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        filled: true,
                        fillColor: AppColors.grey1,
                      ),
                      cursorColor: AppColors.green,
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: BlocConsumer<ProductDetailBloc,
                              ProductDetailState>(
                            listener: (context, state) {
                              if (state.postReviewResponseStatus ==
                                  FormzSubmissionStatus.success) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        Text(translation(context).successful),
                                  ),
                                );

                                
                                Navigator.pop(context);



                              } 
                              else if (state.postReviewResponseStatus ==
                                  FormzSubmissionStatus.failure) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        '${translation(context).failed} ${state.postReviewResponseStatus}'),
                                  ),
                                );
                              }
                            },
                            listenWhen:(o,n)=>o.postReviewResponseStatus!=n.postReviewResponseStatus,
                            builder: (context, state) {
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: AppColors.green,
                                ),
                                onPressed: () {
                                  context.read<ProductDetailBloc>().add(
                                        PostProductsReviewEvent(
                                          postReviewRequestModel:
                                              PostReviewRequestModel(
                                            content: reviewController.text,
                                            forId: widget
                                                .productDetailModel.result.id,
                                            isAnonymous: false,
                                            rating: givenRating,
                                          ),
                                          forId: widget
                                              .productDetailModel.result.id,
                                        ),
                                      );
                                },
                                child:
                                    state.postReviewResponseStatus.isInProgress
                                        ? const SizedBox(
                                            height: 30,
                                            width: 30,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 3,
                                              color: AppColors.white,
                                            ),
                                          )
                                        : Text(
                                            translation(context).publishReview,
                                            style: const TextStyle(
                                              color: AppColors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
