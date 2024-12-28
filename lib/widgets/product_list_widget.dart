import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home/blocs/section_products_bloc/section_products_bloc.dart';
import 'package:flutter_application_1/screens/see_all/see_all_page.dart';
import 'package:flutter_application_1/widgets/indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'product_widget.dart';
import 'title_widget.dart';

class SectionProductsListWidget extends StatefulWidget {
  const SectionProductsListWidget({
    super.key,
    required this.sectionId,
    required this.sectionName,
  });

  final String sectionName;
  final int sectionId;

  @override
  State<SectionProductsListWidget> createState() => _SectionProductsListWidgetState();
}

class _SectionProductsListWidgetState extends State<SectionProductsListWidget> {
  late final ProductsBloc sectionProductsBloc;

  @override
  void initState() {
    super.initState();
    sectionProductsBloc = ProductsBloc()..add(SetSectionIdEvent(widget.sectionId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sectionProductsBloc,
      child: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (ctx, state) {
          if (state.getProductsStatus.isInProgress) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: CustomLoadingIndicator(),
              ),
            );
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
                        builder: (context) => SeeAllPage(
                          categoryId: widget.sectionId,
                          title: widget.sectionName,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 480,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.products.length,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, index) {
                      return ProductWidget(
                        isHomePage: true,
                        index: index,
                        model: state.products[index],
                        // tab: tab[widget.index],
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
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('Error'),
            ),
          );
        },
      ),
    );
  }
}
