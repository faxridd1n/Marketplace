import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/app_icons_path.dart';
import 'package:flutter_application_1/models/product_detail_model/organization_contact_model.dart';
import 'package:flutter_application_1/screens/basket/basket_bloc/basket_bloc.dart';
import 'package:flutter_application_1/screens/organization_page/organization_bloc/organization_bloc.dart';
import 'package:flutter_application_1/widgets/horizontal_product_widget.dart';
import 'package:flutter_application_1/widgets/indicator.dart';
// import 'package:flutter_application_1/widgets/paginator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

import '../../core/constants/app_colors.dart';
import '../../widgets/mini_product.dart';

class OrganizationPage extends StatefulWidget {
  const OrganizationPage(
      {required this.categoryId, required this.contactModel, super.key});
  final int categoryId;
  final OrganizationContactModel contactModel;
  @override
  State<OrganizationPage> createState() => _OrganizationPageState();
}

class _OrganizationPageState extends State<OrganizationPage> {
  late final OrganizationBloc bloc;
  bool isVerticalProduct = true;

  @override
  void initState() {
    bloc = OrganizationBloc()..add(GetAllProductsEvent(widget.categoryId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocBuilder<OrganizationBloc, OrganizationState>(
        builder: (context, state) {
          if (state.getProductStatus.isInProgress) {
            Center(
              child: CustomThicknessIndicator(),
            );
          }
          if (state.getProductStatus.isSuccess) {
            return Scaffold(
              backgroundColor: AppColors.pageBgColor,
              appBar: AppBar(
                elevation: 2,
                shadowColor: AppColors.appBarShadowColor,
                surfaceTintColor: AppColors.transparent,
                backgroundColor: AppColors.white,
                actions: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        setState(() {
                          isVerticalProduct = true;
                        });
                      },
                      icon: SvgPicture.asset(
                        height: 28,
                        width: 28,
                        AppIcons.verticalIcon,
                        color: isVerticalProduct
                            ? AppColors.green
                            : AppColors.grey2,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        setState(() {
                          isVerticalProduct = false;
                        });
                      },
                      icon: SvgPicture.asset(
                        height: 28,
                        width: 28,
                        AppIcons.horizontalIcon,
                        color: isVerticalProduct
                            ? AppColors.grey2
                            : AppColors.green,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 5,
                                color: AppColors.appBarShadowColor,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.organizationHeaderBlue,
                          ),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              // Organization Info
                              SizedBox(
                                height: 80,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const CircleAvatar(
                                      radius: 28,
                                      backgroundImage: NetworkImage(
                                        'https://business.energymarket.uz/api/v1/files/69431af3-7645-4837-98bb-cfa2931e317c',
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          child: Text(
                                            widget.contactModel.result
                                                .organizationName,
                                            maxLines: 2,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: AppColors.white,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: AppColors.yellow,
                                              size: 20,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              '${widget.contactModel.result.rating}',
                                              style: const TextStyle(
                                                color: AppColors.white,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                              '(${widget.contactModel.result.reviewCount.toInt()} ta izohlar)',
                                              style: const TextStyle(
                                                color: AppColors.grey2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              // Description
                              Text(
                                widget.contactModel.result.description,
                                style: const TextStyle(
                                  color: AppColors.grey2,
                                ),
                              ),
                              const SizedBox(height: 30),
                              // Contact Information
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 18,
                                    backgroundColor:
                                        AppColors.organizationHeaderIconBlue,
                                    child: SvgPicture.asset(
                                      AppIcons.call,
                                      color: AppColors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Telefon raqam',
                                        style:
                                            TextStyle(color: AppColors.grey2),
                                      ),
                                      Text(
                                        widget.contactModel.result.phone,
                                        style: const TextStyle(
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 18,
                                    backgroundColor:
                                        AppColors.organizationHeaderIconBlue,
                                    child: SvgPicture.asset(
                                      AppIcons.mail,
                                      color: AppColors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Email adres',
                                        style:
                                            TextStyle(color: AppColors.grey2),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.55,
                                        child: Text(
                                          widget.contactModel.result.email,
                                          style: const TextStyle(
                                            color: AppColors.white,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 18,
                                    backgroundColor:
                                        AppColors.organizationHeaderIconBlue,
                                    child: SvgPicture.asset(
                                      AppIcons.location2,
                                      color: AppColors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Manzil',
                                        style:
                                            TextStyle(color: AppColors.grey2),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.55,
                                        child: Text(
                                          widget.contactModel.result.address,
                                          style: const TextStyle(
                                            color: AppColors.white,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    BlocProvider(
                      create: (ctx) => BasketBloc(),
                      child: Column(
                        children: [
                          // Product Grid/List
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: isVerticalProduct
                                  ? state.productModel!.length *
                                      MediaQuery.of(context).size.height *
                                      0.55
                                  : state.productModel!.length *
                                      140, // Constrain height
                            ),
                            child: isVerticalProduct
                                ? GridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: const EdgeInsets.all(10),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.55,
                                    ),
                                    itemCount: state.productModel!.length,
                                    itemBuilder: (context, index) {
                                      return MiniProductWidget(
                                        index: index,
                                        model: state.productModel![index],
                                      );
                                    },
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: state.productModel!.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 10,
                                        ),
                                        child: HorizontalProductWidget(
                                          model: state.productModel![index],
                                          index: index,
                                        ),
                                      );
                                    },
                                  ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            );
          }
          return const Scaffold(
            body: Center(
              child: Text('Error'),
            ),
          );
        },
      ),
    );
  }
}
