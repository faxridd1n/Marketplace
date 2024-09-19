import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/AppColors.dart';
import 'package:flutter_application_1/screens/category/category_bloc/category_bloc.dart';
import 'package:flutter_application_1/screens/katalog/katalog_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../assets_path/AppImagesPath.dart';

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

  String selectedSubCategory = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider.value(
        value: homeBloc,
        child: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (ctx, state) {
            if (state.getCategoryStatus.isInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state.getCategoryStatus.isSuccess) {
              return Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 1,
                  shadowColor: Colors.black,
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
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    color: Colors.white,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.categoryModel?.item?.length ?? 0,
                        shrinkWrap: true,
                        itemBuilder: (context, parentIndex) {
                          return ExpansionTile(
                            shape: Border.all(color: Colors.transparent),
                            iconColor: AppColors.green,
                            leading: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              height: 45,
                              width: 45,
                              child: FadeInImage(
                                fit: BoxFit.fill,
                                placeholder: const AssetImage(
                                  AppImages.solarPanel1,
                                ),
                                image: NetworkImage(
                                  state.categoryModel?.item?[parentIndex].image
                                          ?.url ??
                                      AppImages.solarPanel1,
                                ),
                                imageErrorBuilder:
                                    (context, error, stackTrace) {
                                  return Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          AppImages.solarPanel1,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            title: Text(
                              state.categoryModel!.item![parentIndex].name!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            children: <Widget>[
                              state.categoryModel!.item![parentIndex].childs!
                                      .isEmpty
                                  ? const ListTile(
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 80),
                                      minTileHeight: 35,
                                      title: Text(
                                        'No options',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    )
                                  : SizedBox(
                                      height: state
                                              .categoryModel!
                                              .item![parentIndex]
                                              .childs!
                                              .length *
                                          45,
                                      child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: state.categoryModel!
                                            .item![parentIndex].childs!.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            padding:
                                                const EdgeInsets.only(left: 60),
                                            // color: Colors.blue,
                                            child: GestureDetector(
                                                onTap: () {
                                                  selectedSubCategory = state
                                                      .categoryModel!
                                                      .item![parentIndex]
                                                      .childs![index]
                                                      .name!;
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          KatalogPage(
                                                        model: state
                                                            .categoryModel!,
                                                        index: parentIndex,
                                                        selectedSubCategory:
                                                            index,
                                                      ),
                                                    ),
                                                  );
                                                  setState(() {});
                                                },
                                                child: ListTile(
                                                  minTileHeight: 35,
                                                  contentPadding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                          vertical: 0,
                                                          horizontal: 20),
                                                  title: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        state
                                                            .categoryModel!
                                                            .item![parentIndex]
                                                            .childs![index]
                                                            .name!,
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      selectedSubCategory ==
                                                              state
                                                                  .categoryModel!
                                                                  .item![
                                                                      parentIndex]
                                                                  .childs![
                                                                      index]
                                                                  .name!
                                                          ? const Divider(
                                                              height: 1,
                                                              color: AppColors
                                                                  .green,
                                                            )
                                                          : index == 0 &&
                                                                  selectedSubCategory !=
                                                                      state
                                                                          .categoryModel!
                                                                          .item![
                                                                              parentIndex]
                                                                          .childs![
                                                                              index]
                                                                          .name!
                                                              ? const Divider(
                                                                  height: 1,
                                                                  color:
                                                                      AppColors
                                                                          .green,
                                                                )
                                                              : const SizedBox(),
                                                    ],
                                                  ),
                                                )),
                                          );
                                        },
                                      ),
                                    )
                            ],
                          );
                        }),
                  ),
                ),
              );
            }
            return const Center(
              child: Text('Error'),
            );
          },
        ),
      ),
    );
  }
}
