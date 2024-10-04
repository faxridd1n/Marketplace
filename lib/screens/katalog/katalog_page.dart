import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/AppIconsPath.dart';
import 'package:flutter_application_1/core/constants/AppColors.dart';
import 'package:flutter_application_1/models/home_model/CategoryModel.dart';
import 'package:flutter_application_1/models/products_model/product_model.dart';
import 'package:flutter_application_1/screens/katalog/katalog_bloc/katalog_bloc.dart';
import 'package:flutter_application_1/widgets/horizontal_product_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

import '../../widgets/product_widget.dart';

// ignore: must_be_immutable
class KatalogPage extends StatefulWidget {
  KatalogPage(
      {required this.model,
      required this.index,
      this.selectedSubCategory,
      super.key});
  CategoryModel model;
  int? selectedSubCategory;
  int index;

  @override
  State<KatalogPage> createState() => _KatalogPageState();
}

class _KatalogPageState extends State<KatalogPage> {
  bool isVerticalProduct = true;
  int selectedSubCategory = 0;
  String selectedItem = '';
  bool popUpIsOpen = false;
  List<String> subCategories = [];
  late final KatalogBloc katalogBloc;
  ProductModel products = ProductModel();

  @override
  void initState() {
    super.initState();
    selectedSubCategory = widget.selectedSubCategory ?? 0;
    if (widget.model.item![widget.index].childs!.isNotEmpty) {
      katalogBloc = KatalogBloc()
        ..add(
          GetKatalogEvent(
            widget.model.item![widget.index].childs![selectedSubCategory].id!,
            10,
          ),
        );

      for (var e in widget.model.item![widget.index].childs!) {
        subCategories.add(e.name!);
      }
      selectedItem = subCategories[widget.selectedSubCategory ?? 0];
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return subCategories.isEmpty
        ? Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: Text(
                "Empty",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        : BlocProvider.value(
            value: katalogBloc,
            child: BlocBuilder<KatalogBloc, KatalogState>(
              builder: (ctx, state) {
                if (state.getFilteredProductStatus.isInProgress) {
                  return const Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(
                          color: AppColors.green, strokeWidth: 3),
                    ),
                  );
                }
                if (state.getFilteredProductStatus.isSuccess) {
                  return Scaffold(
                    backgroundColor: AppColors.pageBgColor,
                    appBar: AppBar(
                      surfaceTintColor: Colors.transparent,
                      elevation: 2,
                      shadowColor: const Color.fromARGB(70, 0, 0, 0),
                      backgroundColor: Colors.white,
                      actions: [
                        widget.model.item![widget.index].childs!.isEmpty
                            ? const SizedBox()
                            : PopupMenuButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                elevation: 5,
                                shadowColor: Colors.black,
                                color: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                offset: const Offset(0, 50),
                                onSelected: (value) {
                                  popUpIsOpen = false;
                                  selectedItem = value.toString();
                                  for (var i = 0;
                                      i < subCategories.length;
                                      i++) {
                                    if (subCategories[i] == selectedItem) {
                                      selectedSubCategory = i;
                                      katalogBloc.add(GetKatalogEvent(
                                          widget.model.item![widget.index]
                                              .childs![selectedSubCategory].id!,
                                          10));
                                      setState(() {});
                                    }
                                  }
                                  setState(() {});
                                },
                                onOpened: () {
                                  popUpIsOpen = true;
                                  setState(() {});
                                },
                                onCanceled: () {
                                  popUpIsOpen = false;
                                  setState(() {});
                                },
                                initialValue: selectedItem.isEmpty
                                    ? widget.model.item![widget.index]
                                        .childs![0].name!
                                    : selectedItem,
                                icon: Row(
                                  children: [
                                    const SizedBox(width: 5),
                                    Text(
                                      selectedItem.isEmpty
                                          ? widget.model.item![widget.index]
                                              .childs![0].name!
                                          : selectedItem,
                                      textAlign: TextAlign.right,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      popUpIsOpen
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down,
                                      size: 20,
                                    )
                                  ],
                                ),
                                itemBuilder: (BuildContext context) {
                                  return subCategories.map((String choice) {
                                    return PopupMenuItem<String>(
                                      value: choice,
                                      child: Text(choice),
                                    );
                                  }).toList();
                                },
                              ),
                      ],
                      bottom: PreferredSize(
                        preferredSize: Size.fromHeight(55),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
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
                                  state.filteredProductModel!.length.toString(),
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
                              ]),
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
                      ),
                    ),
                    body: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: ListView.builder(
                              // controller: _scrollController,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: state.filteredProductModel!.length,
                              itemBuilder: (context, index) {
                                if (index >=
                                    state.filteredProductModel!.length) {
                                  return const Center(
                                      child: CircularProgressIndicator(
                                          color: AppColors.green,
                                          strokeWidth: 3));
                                }
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: isVerticalProduct ? 30 : 10,
                                    vertical: 10,
                                  ),
                                  child: isVerticalProduct
                                      ? ProductWidget(
                                          isKatalogPage: true,
                                          index: index,
                                          model: state
                                              .filteredProductModel![index],
                                          tab: null,
                                        )
                                      : HorizontalProductWidget(
                                          model: state
                                              .filteredProductModel![index],
                                          index: index,
                                          isKatalogPage: true,
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
