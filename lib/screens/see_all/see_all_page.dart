import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets_path/AppIconsPath.dart';
import 'package:flutter_application_1/screens/see_all/see_all_bloc/see_all_bloc.dart';
import 'package:flutter_application_1/screens/see_all/widgets/bottom_sheet_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import '../home/widgets/ProductWidget.dart';

// ignore: must_be_immutable
class SeeAllPage extends StatefulWidget {
  SeeAllPage({required this.tab, super.key});
  int tab;
  @override
  State<SeeAllPage> createState() => _SeeAllPageState();
}

class _SeeAllPageState extends State<SeeAllPage> {
  late final SeeAllBloc bloc;
  @override
  void initState() {
    bloc = SeeAllBloc()
      ..add(GetAllProductsEvent(widget.tab))
      ..add(GetSearchFiltersEvent(widget.tab));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocBuilder<SeeAllBloc, SeeAllState>(
        builder: (context, state) {
          if (state.getProductStatus.isInProgress) {
            const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.getProductStatus.isSuccess) {
            return Scaffold(
              appBar: AppBar(
                actions: [
                  Row(
                    children: [
                      const Text('Filters:'),
                      IconButton(
                        onPressed: () {
                          openFilterSheet(context, 10, 50000, true, false,
                              state.filteredProductModel!);
                        },
                        icon: SvgPicture.asset(
                          AppIcons.filter,
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  )
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
                          state.productModel!.length.toString(),
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
                        itemCount: state.productModel!.length,
                        itemBuilder: (context, index) {
                          if (index >= state.productModel!.length) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            child: ProductWidget(
                              isSeeAllPage: true,
                              index: index,
                              model: state.productModel![index],
                              isMaxWidth: true,
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
