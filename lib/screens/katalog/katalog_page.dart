import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/home_model/CategoryModel.dart';
import 'package:flutter_application_1/models/products_model/product_model.dart';
import 'package:flutter_application_1/screens/home/widgets/ProductWidget.dart';
import 'package:flutter_application_1/screens/katalog/katalog_bloc/katalog_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

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
        ..add(GetKatalogEvent(
            widget.model.item![widget.index].childs![selectedSubCategory].id!
               ,
            10));

      for (var e in widget.model.item![widget.index].childs!) {
        subCategories.add(e.name!);
      }
      selectedItem=subCategories[widget.selectedSubCategory??0];



    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return subCategories.length == 0
        ? Scaffold(
            appBar: AppBar(),
            body: Center(
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
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (state.getFilteredProductStatus.isSuccess) {
                  return Scaffold(
                    backgroundColor: Colors.white,
                    appBar: AppBar(
                      elevation: 1,
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
                    ),
                    body: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
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
                            ],
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: ListView.builder(
                              // controller: _scrollController,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  //  state.hasReachedMax
                                  //     ? state.filteredProductModel?.length ?? 0
                                  //     : state.filteredProductModel?.length ?? 0 + 1,
                                  state.filteredProductModel!.length,
                              itemBuilder: (context, index) {
                                if (index >=
                                    state.filteredProductModel!.length) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  child: ProductWidget(
                                    index: index,
                                    model: state.filteredProductModel![index],
                                    isMaxWidth: true,
                                    tab: null,
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
