import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../assets_path/app_icons_path.dart';
import '../../../core/constants/app_colors.dart';
import '../buy_now_bloc/buy_now_bloc.dart';
import 'package:formz/formz.dart';

class SelectAddresWidget extends StatefulWidget {
  const SelectAddresWidget({super.key});
  // final LocationModel locationModel;
  @override
  State<SelectAddresWidget> createState() => _SelectAddresWidgetState();
}

class _SelectAddresWidgetState extends State<SelectAddresWidget> {
  String selectedRegion = '';
  String selectedDistrict = '';
  late final BuyNowBloc buyNowBloc;

  @override
  void initState() {
    super.initState();
    buyNowBloc = BuyNowBloc();
    buyNowBloc.add(GetRegionsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => buyNowBloc,
      child: BlocBuilder<BuyNowBloc, BuyNowState>(
        builder: (ctx, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Регион'),
              const SizedBox(height: 10),
              SizedBox(
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: AppColors.grey1,
                  ),
                  onPressed: () {
                    showModalBottomSheet<void>(
                      backgroundColor: AppColors.transparent,
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        final ScrollController controller = ScrollController();
                        return Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(15),
                            ),
                            color: AppColors.white,
                          ),
                          height: 400,
                          padding: const EdgeInsets.only(
                            top: 5,
                            bottom: 15,
                            right: 15,
                            left: 15,
                          ),
                          child: Column(
                            children: [
                              // Modal handle
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 40,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.grey3,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),

                              // Title Row
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'O\'rnatish manzili',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  IconButton(
                                    padding: const EdgeInsets.all(0),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon: SvgPicture.asset(
                                      AppIcons.xIcon,
                                      height: 25,
                                      semanticsLabel: 'Close',
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),

                              // Region List
                              Expanded(
                                child: ListView.builder(
                                  controller: controller,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount:
                                      state.regionModel!.result.regions.length,
                                  itemBuilder: (context, index) {
                                    final region = state
                                        .regionModel!.result.regions[index];
                                    return InkWell(
                                      onTap: () {
                                        buyNowBloc
                                            .add(GetDistrictsEvent(region.id));
                                        selectedRegion = region.name;
                                        setState(() {});
                                        Navigator.of(context).pop();
                                      },
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 50,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Divider(
                                              height: 0.5,
                                              thickness: 0.5,
                                              color: AppColors.grey3,
                                            ),
                                            const SizedBox(height: 13),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(region.name),
                                                if (selectedRegion ==
                                                    region.name)
                                                  const Icon(
                                                    Icons
                                                        .check_circle_outline_outlined,
                                                    color: AppColors.green,
                                                  ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child:
                      state.getRegionsStatus == FormzSubmissionStatus.inProgress
                          ? const Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator(
                                  strokeWidth: 3,
                                  color: AppColors.green,
                                ),
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  selectedRegion.isEmpty
                                      ? 'Mintaqani tanlang'
                                      : selectedRegion,
                                  style: TextStyle(
                                    color: selectedRegion.isEmpty
                                        ? AppColors.grey2
                                        : AppColors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Row(
                                  children: [
                                    if (selectedRegion.isNotEmpty)
                                      SizedBox(
                                        width: 30,
                                        child: IconButton(
                                          padding: const EdgeInsets.all(0),
                                          onPressed: () {
                                            selectedRegion = '';
                                            setState(() {});
                                          },
                                          icon: SvgPicture.asset(
                                            AppIcons.xIcon,
                                            semanticsLabel: 'Clear Selection',
                                          ),
                                        ),
                                      ),
                                    const Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: AppColors.grey2,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Район'),
              const SizedBox(height: 10),
              SizedBox(
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide.none,
                    ),
                    backgroundColor: AppColors.grey1,
                  ),
                  onPressed: () {
                    showModalBottomSheet<void>(
                      backgroundColor: AppColors.transparent,
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        final ScrollController controller = ScrollController();
                        return Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(15),
                            ),
                            color: AppColors.white,
                          ),
                          height: 400,
                          padding: const EdgeInsets.only(
                            top: 5,
                            bottom: 15,
                            right: 15,
                            left: 15,
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.grey3,
                                  ),
                                  width: 40,
                                  height: 5,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Tuman',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  IconButton(
                                    padding: const EdgeInsets.all(0),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon: SvgPicture.asset(
                                      AppIcons.xIcon,
                                      height: 25,
                                      semanticsLabel: 'Close',
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              selectedRegion.isEmpty
                                  ? const Expanded(
                                      child: Center(
                                        child: Text(
                                          'No options',
                                          style: TextStyle(
                                            color: AppColors.grey2,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Expanded(
                                      child: ListView.builder(
                                        controller: controller,
                                        physics: const BouncingScrollPhysics(),
                                        itemCount: state.districtModel!.result
                                            .districts.length,
                                        itemBuilder: (context, index) {
                                          final districtName = state
                                              .districtModel!
                                              .result
                                              .districts[index]
                                              .name;
                                          return InkWell(
                                            onTap: () {
                                              selectedDistrict = districtName;
                                              Navigator.of(context).pop();
                                              setState(() {});
                                            },
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 50,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Divider(
                                                    height: 0.5,
                                                    thickness: 0.5,
                                                    color: AppColors.grey3,
                                                  ),
                                                  const SizedBox(height: 13),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(districtName),
                                                      selectedDistrict ==
                                                              districtName
                                                          ? const Icon(
                                                              Icons
                                                                  .check_circle_outline_outlined,
                                                              color: AppColors
                                                                  .green,
                                                            )
                                                          : const SizedBox(),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: state.getDistrictsStatus ==
                          FormzSubmissionStatus.inProgress
                      ? const Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                              color: AppColors.green,
                            ),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              selectedDistrict.isEmpty
                                  ? 'Выбрать район'
                                  : selectedDistrict,
                              style: TextStyle(
                                color: selectedDistrict.isEmpty
                                    ? AppColors.grey2
                                    : AppColors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Row(
                              children: [
                                if (selectedDistrict.isNotEmpty)
                                  SizedBox(
                                    width: 30,
                                    child: IconButton(
                                      padding: const EdgeInsets.all(0),
                                      onPressed: () {
                                        selectedDistrict = '';
                                        setState(() {});
                                      },
                                      icon: SvgPicture.asset(
                                        AppIcons.xIcon,
                                        semanticsLabel: 'Clear Selection',
                                      ),
                                    ),
                                  ),
                                const Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: AppColors.grey2,
                                ),
                              ],
                            ),
                          ],
                        ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Адрес'),
              const SizedBox(height: 10),
              TextFormField(
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                cursorWidth: 1.5,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Введите адрес',
                  hintStyle: const TextStyle(
                    color: AppColors.grey2,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  filled: true,
                  fillColor: AppColors.grey1,
                ),
                cursorColor: AppColors.green,
              ),
            ],
          );
        },
      ),
    );
  }
}
