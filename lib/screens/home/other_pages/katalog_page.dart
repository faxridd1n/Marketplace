import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/categories_model/CategoryModel.dart';
import 'package:flutter_application_1/screens/home/widgets/ProductWidget.dart';
import 'package:flutter_application_1/service/home_service/HomePageServices.dart';

// ignore: must_be_immutable
class KatalogPage extends StatefulWidget {
  KatalogPage({required this.model, required this.index, super.key});
  CategoryModel model;
  int index;

  @override
  State<KatalogPage> createState() => _KatalogPageState();
}

class _KatalogPageState extends State<KatalogPage> {
  int selectedSubCategory = 0;
  String selectedItem = '';
  bool popUpIsOpen = false;
  List<String> subCategories = [];
  @override
  void initState() {
    for (var e in widget.model.item![widget.index].childs!) {
      subCategories.add(e.name!);
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    selectedItem = value.toString();
                    popUpIsOpen = false;
                    for (var i = 0; i < subCategories.length; i++) {
                      if (subCategories[i] == selectedItem) {
                        selectedSubCategory = i;
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
                      ? widget.model.item![widget.index].childs![0].name!
                      : selectedItem,
                  icon: Row(
                    children: [
                      // SvgPicture.asset(AppIcons.catalogue,color: AppColors.green,),
                      const SizedBox(width: 5),
                      Text(
                        selectedItem.isEmpty
                            ? widget.model.item![widget.index].childs![0].name!
                            : selectedItem,
                        textAlign: TextAlign.right,
                        overflow: TextOverflow.ellipsis,
                        style:  TextStyle(
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
      body: widget.model.item![widget.index].childs!.isEmpty
          ? const Center(
              child: Text(
                'Empty',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          : FutureBuilder(
              future: GetProductService.getFilteredProducts(
                  selectedItem.isEmpty
                      ? widget.model.item![widget.index].childs![0].id!
                      : widget.model.item![widget.index]
                          .childs![selectedSubCategory].id!),
              builder: (context, snapshot) {
                return 
                snapshot.connectionState == ConnectionState.done
                    ? Column(
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
                                  snapshot.data!.length.toString(),
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
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: ProductWidget(
                                      index: index,
                                      model: snapshot.data![index],
                                      isMaxWidth: true,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      )
                    : snapshot.connectionState == ConnectionState.waiting
                        ? const Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                            ),
                          )
                        : Center(
                            child: Text(
                              snapshot.data.toString(),
                            ),
                          );
                
              }),
    );
  }
}
