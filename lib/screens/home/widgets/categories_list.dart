import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home/blocs/categories_bloc/categories_bloc.dart';
import 'package:flutter_application_1/screens/home/widgets/category_widget.dart';
import 'package:flutter_application_1/widgets/indicator.dart';
import 'package:flutter_application_1/widgets/title_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class CategoriesListWidget extends StatelessWidget {
  const CategoriesListWidget  ({super.key});



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleWidget(
          titleText: 'Kategoriyalar',
        ),
        BlocBuilder<CategoriesBloc, CategoriesState>(
          builder: (ctx, state) {
            if (state.getCategoriesStatus.isInProgress) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: CustomLoadingIndicator(),
                ),
              );
            }
            if (state.getCategoriesStatus.isSuccess) {
              return SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.categories.item.length,
                  itemBuilder: (context, index) {
                    return CategoryWidget(
                      model:state.categories.item[index],
                    );
                  },
                ),
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
      ],
    );
  }

}
