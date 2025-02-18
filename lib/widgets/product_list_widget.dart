import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/basket/basket_bloc/basket_bloc.dart';
import 'package:flutter_application_1/screens/home/blocs/section_products_bloc/section_products_bloc.dart';
import 'package:flutter_application_1/screens/see_all/see_all_page.dart';
import 'package:flutter_application_1/widgets/product_widget_shimmer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../screens/navigation/navigation_page.dart';
import 'product_widget.dart';
import 'title_widget.dart';

class SectionProductsListWidget extends StatefulWidget {
  const SectionProductsListWidget({
    super.key,
    this.categoryId,
    this.sectionId,
    required this.size,
    this.page,
    required this.sectionName,
  });

  final String sectionName;
  final String? sectionId;
  final String? categoryId;
  final int size;
  final int? page;
  @override
  State<SectionProductsListWidget> createState() =>
      _SectionProductsListWidgetState();
}

class _SectionProductsListWidgetState extends State<SectionProductsListWidget> {
  late final ProductsBloc sectionProductsBloc;

  @override
  void initState() {
    super.initState();
    sectionProductsBloc = ProductsBloc();
    context.read<BasketBloc>().add(GetBasketProductsEvent());
    if (widget.sectionId != null) {
      sectionProductsBloc
          .add(SetSectionIdEvent(widget.sectionId!, widget.page!, widget.size));
      // sectionProductsBloc.add(GetBasketProductEvent());
    } else if (widget.categoryId != null) {
      sectionProductsBloc.add(
        SetCategoryIdEvent(
          int.parse(widget.categoryId!),
          widget.size,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sectionProductsBloc,
      child: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (ctx, state) {
          if (state.getProductsStatus.isInProgress) {
            return const ShimmerLoading();
          }
          if (state.getProductsStatus.isSuccess) {
            if (state.products.isEmpty) {
              return const SizedBox.shrink();
            }
            return Column(
              children: [
                TitleWidget(
                  titleText: widget.sectionName,
                  onSeaAllTap: () {
                    Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(
                        builder: (ctx) => HomeTabControllerProvider(
                          controller:
                              HomeTabControllerProvider.of(context).controller,
                          child: SeeAllPage(
                            categoryId: widget.categoryId,
                            sectionId: widget.sectionId,
                            page: 1,
                            size: 16,
                            title: widget.sectionName,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 450,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.products.length,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    itemBuilder: (context, index) {
                      return ProductWidget(
                        model: state.products[index],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(width: 10);
                    },
                  ),
                ),
                
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
