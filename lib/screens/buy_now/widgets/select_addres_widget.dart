import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../assets_path/app_icons_path.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/language/language_constants.dart';
import '../buy_now_bloc/buy_now_bloc.dart';
import 'package:formz/formz.dart';

class SelectAddresWidget extends StatefulWidget {
  const SelectAddresWidget({super.key});
  @override
  State<SelectAddresWidget> createState() => _SelectAddresWidgetState();
}

class _SelectAddresWidgetState extends State<SelectAddresWidget> {
  String selectedRegion = '';
  String selectedDistrict = '';

  @override
  void initState() {
    super.initState();
    context.read<BuyNowBloc>().add(GetRegionsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuyNowBloc, BuyNowState>(
      builder: (ctx, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(translation(context).region),
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
                    builder: (BuildContext ctx) {
                      final ScrollController controller = ScrollController();
                      return BlocProvider.value(
                        value: context.read<
                            BuyNowBloc>(), // Asosiy BlocProvider'dan olamiz
                        child: Container(
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
                                  Text(
                                    translation(context).installationAddress,
                                    style: const TextStyle(
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
                              state.getRegionsStatus.isSuccess &&
                                      state
                                          .regionModel.result.regions.isNotEmpty
                                  ?
                                  // Region List
                                  Expanded(
                                      child: ListView.builder(
                                        controller: controller,
                                        physics: const BouncingScrollPhysics(),
                                        itemCount: state
                                            .regionModel.result.regions.length,
                                        itemBuilder: (ctx, index) {
                                          final region = state.regionModel
                                              .result.regions[index];
                                          return InkWell(
                                            onTap: () {
                                              selectedRegion = region.name;
                                              context.read<BuyNowBloc>().add(
                                                  GetDistrictsEvent(region.id));
                                              context
                                                  .read<BuyNowBloc>()
                                                  .add(SelectRegionEvent(
                                                    regionId: region.id,
                                                  ));
                                              Navigator.of(context).pop();
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
                                                      Text(region.name),
                                                      if (selectedRegion ==
                                                          region.name)
                                                        const Icon(
                                                          Icons
                                                              .check_circle_outline_outlined,
                                                          color:
                                                              AppColors.green,
                                                        ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  : Expanded(
                                      child: Center(
                                        child: Text(
                                          translation(context).noOptions,
                                          style: const TextStyle(
                                            color: AppColors.grey2,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedRegion.isEmpty
                          ? translation(context).selectRegion
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
            Text(translation(context).district),
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
                    builder: (BuildContext ctx) {
                      final ScrollController controller = ScrollController();
                      return BlocProvider.value(
                        value: context.read<BuyNowBloc>(),
                        child: Container(
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
                                  Text(
                                    translation(context).selectDistrict,
                                    style: const TextStyle(
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
                              state.getRegionsStatus.isFailure ||
                                      state.getDistrictsStatus.isFailure ||
                                      selectedRegion.isEmpty
                                  ? Expanded(
                                      child: Center(
                                        child: Text(
                                          translation(context).noOptions,
                                          style: const TextStyle(
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
                                        itemCount: state.districtModel.result
                                            .districts.length,
                                        itemBuilder: (context, index) {
                                          final district = state.districtModel
                                              .result.districts[index];
                                          return InkWell(
                                            onTap: () {
                                              selectedDistrict = district.name;
                                              setState(() {});
                                              context.read<BuyNowBloc>().add(
                                                    SelectDistrictEvent(
                                                      districtId: district.id,
                                                    ),
                                                  );

                                              Navigator.of(context).pop();
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
                                                      Text(district.name),
                                                      selectedDistrict ==
                                                              district.name
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
                        ),
                      );
                    },
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedDistrict.isEmpty
                          ? translation(context).selectDistrict
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
            Text(translation(context).address),
            const SizedBox(height: 10),
            TextFormField(
              onChanged: (value) {
                context.read<BuyNowBloc>().add(
                      FillAddressEvent(
                        address: value,
                      ),
                    );
              },
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
                hintText: translation(context).enterAddress,
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
    );
  }
}
