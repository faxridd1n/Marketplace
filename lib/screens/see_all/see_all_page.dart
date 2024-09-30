import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/AppIconsPath.dart';
import 'package:flutter_application_1/screens/see_all/see_all_bloc/see_all_bloc.dart';
import 'package:flutter_application_1/screens/see_all/widgets/bottom_sheet_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import '../../core/constants/AppColors.dart';
import '../../widgets/product_widget.dart';
import '../../widgets/horizontal_product_widget.dart';

// ignore: must_be_immutable
class SeeAllPage extends StatefulWidget {
  SeeAllPage({required this.tab, super.key});
  int tab;
  @override
  State<SeeAllPage> createState() => _SeeAllPageState();
}

class _SeeAllPageState extends State<SeeAllPage> {
  late final SeeAllBloc bloc;
  bool isVerticalProduct = true;

  @override
  void initState() {
    bloc = SeeAllBloc()
      ..add(GetAllProductsEvent(widget.tab))
      ..add(GetSearchFiltersEvent(widget.tab));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocBuilder<SeeAllBloc, SeeAllState>(
        builder: (context, state) {
          if (state.getProductStatus.isInProgress) {
            const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.getProductStatus.isSuccess) {
            return Scaffold(
              backgroundColor: AppColors.pageBgColor,
              appBar: AppBar(
                surfaceTintColor: Colors.transparent,
                backgroundColor: Colors.white,
                actions: [
                  Row(
                    children: [
                      const Text('Filters:'),
                      IconButton(
                        onPressed: () {
                          openFilterSheet(context, state.filteredProductModel!);
                        },
                        icon: SvgPicture.asset(
                          AppIcons.filter,
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  )
                ],
              ),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Результаты:',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              state.productModel!.length.toString(),
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.amber),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              'товаров',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 40,
                                height: 40,
                                child: IconButton(
                                  padding: EdgeInsets.all(0),
                                  onPressed: () {
                                    isVerticalProduct = true;
                                    setState(() {});
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
                                  padding: EdgeInsets.all(0),
                                  onPressed: () {
                                    isVerticalProduct = false;
                                    setState(() {});
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.productModel!.length,
                        itemBuilder: (context, index) {
                          if (index >= state.productModel!.length) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: isVerticalProduct ? 30 : 10,
                              vertical: 10,
                            ),
                            child: isVerticalProduct
                                ? ProductWidget(
                                    isSeeAllPage: true,
                                    index: index,
                                    model: state.productModel![index],
                                  )
                                : HorizontalProductWidget(
                                    isSeeAllPage: true,
                                    model: state.productModel![index],
                                    index: index,
                                  ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
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
