import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'product_widget.dart';
import '../screens/home/home_bloc/home_bloc.dart';
import 'title_widget.dart';

class ProductListWidget extends StatefulWidget {
  const ProductListWidget({required this.index, super.key});

  final int index;

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  late HomeBloc homeBloc;
  List tab = [53,54,55,56,57];
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
    return BlocProvider(
      create: (_) => homeBloc, // Bloc is created here.
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (ctx, state) {
          if (state.getProductStatus.isInProgress) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child:CustomThicknessIndicator(),
              ),
            );
          }
          if (state.getProductStatus.isSuccess) {
            for (var i in tab) {
              for (var e in state.tabsModel!.result.items) {
                if (i == e.id) {
                  tabsName.add(e.name );
                }
              }
            }
            return Column(
              children: [
                TitleWidget(
                  titleText: tabsName[widget.index],
                  withSeeAllButton: true,
                  categoryId: state.productModel1![0].categoryId,
                ),
                SizedBox(
                  height: 480,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: state.productModel1?.length ?? 0,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ProductWidget(
                          isHomePage: true,
                          index: index,
                          model: state.productModel1![index],
                          // tab: tab[widget.index],
                        ),
                      );
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
