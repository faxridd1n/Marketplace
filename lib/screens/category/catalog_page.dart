import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app_colors.dart';
import 'package:flutter_application_1/screens/category/widgets/category_expansion_widget.dart';
import 'package:flutter_application_1/screens/home/blocs/categories_bloc/categories_bloc.dart';
import 'package:flutter_application_1/widgets/indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  int openedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        surfaceTintColor: AppColors.transparent,
        backgroundColor: AppColors.white,
        elevation: 0,
        shadowColor: AppColors.appBarShadowColor,
        title: const Text(
          'Каталог',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (ctx, state) {
          if (state.getCategoriesStatus.isInProgress) {
            return const Center(
              child: CustomLoadingIndicator(),
            );
          }
          if (state.getCategoriesStatus.isSuccess) {
            return ListView.builder(
              itemCount: state.categories.item.length,
              itemBuilder: (ctx, index) {
                return CategoryExpansionWidget(
                  category: state.categories.item[index],
                  isOpened: openedIndex == index,
                  onOpened: (bool value) {
                    setState(() {
                      openedIndex = index;
                    });
                  },
                );
              },
            );
          }
          return const Center(
            child: Text('Error'),
          );
        },
      ),
    );
  }
}
