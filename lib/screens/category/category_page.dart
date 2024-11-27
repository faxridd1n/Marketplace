import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/category/category_bloc/category_bloc.dart';
import 'package:flutter_application_1/screens/category/widgets/category_expansion_widget.dart';
import 'package:flutter_application_1/widgets/indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../core/constants/app_colors.dart';


class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late final CategoryBloc homeBloc;

  @override
  void initState() {
    super.initState();
    homeBloc = CategoryBloc()..add(GetCategoriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return  BlocProvider.value(
        value: homeBloc,
        child: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (ctx, state) {
            if (state.getCategoryStatus.isInProgress) {
              return Center(
                child:CustomThicknessIndicator(),
              );
            }
            if (state.getCategoryStatus.isSuccess) {
              return Scaffold(
                backgroundColor:AppColors.white,
                appBar: AppBar(
                  surfaceTintColor:AppColors.transparent,
                  backgroundColor:AppColors.white,
                  elevation: 2,
                  shadowColor: AppColors.appBarShadowColor
                  ,
                  title: const Text(
                    'Каталог',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                    color:AppColors.white,
                    child: CategoryExpansionWidget(
                      model: state.categoryModel!,
                    ),
                  ),
                ),
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
