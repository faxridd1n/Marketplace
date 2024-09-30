import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../../widgets/product_widget.dart';
import '../home_bloc/home_bloc.dart';
import 'TitleWidget.dart';

// ignore: must_be_immutable
class ProductListWidget extends StatefulWidget {
  ProductListWidget({required this.index, super.key});

  int index;
  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  late final HomeBloc homeBloc;
  List tab = [37, 35, 39, 34, 30, 32, 31, 40, 41];
  List tabsName = [];

  @override
  void initState() {
    super.initState();
    homeBloc = HomeBloc();
    getProducts();
  }

  void getProducts() async {
    homeBloc.add(GetTabsEvent());
    await Future.delayed(const Duration(milliseconds: 200));
    homeBloc.add(GetProduct1Event(tab[widget.index]));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: homeBloc,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (ctx, state) {
          if (state.getProductStatus.isInProgress) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state.getProductStatus.isSuccess) {
            for (var i in tab) {
              for (var e in state.tabsModel!.result!.items!) {
                if (i == e.id) {
                  tabsName.add(e.name ?? 'Empty');
                }
              }
            }
            return Column(
              children: [
                TitleWidget(
                  titleText: tabsName[widget.index],
                  withSeeAllButton: true,
                  tab: tab[widget.index],
                ),
                SizedBox(
                  width: double.infinity,
                  height: 520,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: state.productModel1?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: ProductWidget(
                          isHomePage: true,
                          index: index,
                          model: state.productModel1![index],
                          tab: tab[widget.index],
                        ),
                      );
                    },
                  ),
                ),
              ],
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
