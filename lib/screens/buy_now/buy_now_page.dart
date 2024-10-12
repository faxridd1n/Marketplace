import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/AppColors.dart';
import 'package:flutter_application_1/screens/buy_now/buy_now_bloc/buy_now_bloc.dart';
import 'package:flutter_application_1/screens/buy_now/widgets/payment_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';

import '../../assets_path/AppIconsPath.dart';

class BuyNowPage extends StatefulWidget {
  const BuyNowPage({super.key});

  @override
  State<BuyNowPage> createState() => _BuyNowPageState();
}

class _BuyNowPageState extends State<BuyNowPage> {
  bool paymentType1 = true;
  bool paymentType2 = false;
  bool paymentType3 = false;
  bool deliveryType1 = true;
  bool deliveryType2 = false;
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: const Color.fromARGB(84, 0, 0, 0),
        title: const Text('Umumiy ma\'lumotlar'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('To\'lov turini tanlang'),
              const SizedBox(height: 5),
              Wrap(
                children: [
                  GestureDetector(
                    onTap: () {
                      paymentType1 = true;
                      paymentType2 = false;
                      paymentType3 = false;
                      setState(() {});
                    },
                    child: PaymentWidget(
                      isSelected: paymentType1,
                      deliveryType: null,
                      paymentType: 0,
                      isPaymentWidget: true,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      paymentType1 = false;
                      paymentType2 = true;
                      paymentType3 = false;
                      setState(() {});
                    },
                    child: PaymentWidget(
                      isSelected: paymentType2,
                      deliveryType: null,
                      paymentType: 1,
                      isPaymentWidget: true,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      paymentType1 = false;
                      paymentType2 = false;
                      paymentType3 = true;
                      setState(() {});
                    },
                    child: PaymentWidget(
                      isSelected: paymentType3,
                      deliveryType: null,
                      paymentType: 2,
                      isPaymentWidget: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Yetkazib berish turini tanlang'),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      deliveryType1 = true;
                      deliveryType2 = false;
                      setState(() {});
                    },
                    child: PaymentWidget(
                      isSelected: deliveryType1,
                      deliveryType: 0,
                      paymentType: null,
                      isPaymentWidget: false,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      deliveryType1 = false;
                      deliveryType2 = true;
                      setState(() {});
                    },
                    child: PaymentWidget(
                      isSelected: deliveryType2,
                      deliveryType: 1,
                      paymentType: null,
                      isPaymentWidget: false,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Manzil'),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                child: TextFormField(
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
                      borderSide: const BorderSide(
                        width: 1,
                        color: AppColors.grey3,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        width: 1,
                        color: AppColors.grey3,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: AppColors.green,
                      ),
                    ),
                    hintText: 'Manzilni kiriting',
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
              ),
              const SizedBox(height: 20),
              BlocProvider.value(
                value: buyNowBloc,
                child: BlocBuilder<BuyNowBloc, BuyNowState>(
                  builder: (ctx, state) {
                    if (state.getRegionsStatus.isInProgress) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: CircularProgressIndicator(
                              color: AppColors.green, strokeWidth: 3),
                        ),
                      );
                    }
                    if (state.getRegionsStatus.isSuccess) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('O\'rnatish manzili'),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide(
                                      color: AppColors.grey3,
                                    )),
                                backgroundColor: AppColors.grey1,
                              ),
                              onPressed: () {
                                showModalBottomSheet<void>(
                                  backgroundColor: Colors.transparent,
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (BuildContext context) {
                                    ScrollController controller =
                                        ScrollController();
                                    return Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(15),
                                        ),
                                        color: Colors.white,
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
                                                borderRadius:
                                                    BorderRadius.circular(10),
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
                                                'O\'rnatish manzili',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.start,
                                              ),
                                              IconButton(
                                                padding:
                                                    const EdgeInsets.all(0),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                icon: SvgPicture.asset(
                                                  AppIcons.xIcon,
                                                  height: 25,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Expanded(
                                            child: ListView.builder(
                                              controller: controller,
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              itemCount: state.regionModel!
                                                  .result!.regions!.length,
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                                    buyNowBloc.add(
                                                      GetDistrictsEvent(
                                                        state
                                                            .regionModel!
                                                            .result!
                                                            .regions![index]
                                                            .id!,
                                                      ),
                                                    );
                                                    selectedRegion = state
                                                        .regionModel!
                                                        .result!
                                                        .regions![index]
                                                        .name!;
                                                    setState(() {});
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 50,
                                                    //  color: Colors.red,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Divider(
                                                          height: 0.5,
                                                          thickness: 0.5,
                                                          color:
                                                              AppColors.grey3,
                                                        ),
                                                        const SizedBox(
                                                            height: 13),
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              state
                                                                  .regionModel!
                                                                  .result!
                                                                  .regions![
                                                                      index]
                                                                  .name!,
                                                            ),
                                                            selectedRegion ==
                                                                    state
                                                                        .regionModel!
                                                                        .result!
                                                                        .regions![
                                                                            index]
                                                                        .name!
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
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Row(
                                children: [
                                  Text(
                                    selectedRegion.isEmpty
                                        ? 'Mintaqani tanlang'
                                        : selectedRegion,
                                    style: TextStyle(
                                      color: selectedRegion.isEmpty
                                          ? AppColors.grey2
                                          : Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                  selectedRegion.isNotEmpty
                                      ? SizedBox(
                                          width: 30,
                                          child: IconButton(
                                            padding: const EdgeInsets.all(0),
                                            onPressed: () {
                                              selectedRegion = '';
                                              setState(() {});
                                            },
                                            icon: SvgPicture.asset(
                                              AppIcons.xIcon,
                                            ),
                                          ),
                                        )
                                      : const SizedBox(),
                                  const Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: AppColors.grey2,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text('Tuman'),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide(
                                      color: AppColors.grey3,
                                    )),
                                backgroundColor: AppColors.grey1,
                              ),
                              onPressed: () {
                                showModalBottomSheet<void>(
                                  backgroundColor: Colors.transparent,
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (BuildContext context) {
                                    ScrollController controller =
                                        ScrollController();
                                    return Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(15),
                                        ),
                                        color: Colors.white,
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
                                                borderRadius:
                                                    BorderRadius.circular(10),
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
                                                textAlign: TextAlign.start,
                                              ),
                                              IconButton(
                                                padding:
                                                    const EdgeInsets.all(0),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                icon: SvgPicture.asset(
                                                  AppIcons.xIcon,
                                                  height: 25,
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
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Expanded(
                                                  child: ListView.builder(
                                                    controller: controller,
                                                    physics:
                                                        const BouncingScrollPhysics(),
                                                    itemCount: state
                                                        .districtModel!
                                                        .result!
                                                        .districts!
                                                        .length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return InkWell(
                                                        onTap: () {
                                                          selectedDistrict =
                                                              state
                                                                  .districtModel!
                                                                  .result!
                                                                  .districts![
                                                                      index]
                                                                  .name!;
                                                          Navigator.of(context)
                                                              .pop();
                                                          setState(() {});
                                                        },
                                                        child: SizedBox(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          height: 50,
                                                          //  color: Colors.red,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              const Divider(
                                                                height: 0.5,
                                                                thickness: 0.5,
                                                                color: AppColors
                                                                    .grey3,
                                                              ),
                                                              const SizedBox(
                                                                  height: 13),
                                                              Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    state
                                                                        .districtModel!
                                                                        .result!
                                                                        .districts![
                                                                            index]
                                                                        .name!,
                                                                  ),
                                                                  selectedDistrict ==
                                                                          state
                                                                              .districtModel!
                                                                              .result!
                                                                              .districts![index]
                                                                              .name!
                                                                      ? const Icon(
                                                                          Icons
                                                                              .check_circle_outline_outlined,
                                                                          color:
                                                                              AppColors.green,
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
                                                )
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Row(
                                children: [
                                  Text(
                                    selectedDistrict.isEmpty
                                        ? 'Tumanni tanlang'
                                        : selectedDistrict,
                                    style: TextStyle(
                                      color: selectedDistrict.isEmpty
                                          ? AppColors.grey2
                                          : Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                  selectedDistrict.isNotEmpty
                                      ? SizedBox(
                                          width: 30,
                                          child: IconButton(
                                            padding: const EdgeInsets.all(0),
                                            onPressed: () {
                                              selectedDistrict = '';
                                              setState(() {});
                                            },
                                            icon: SvgPicture.asset(
                                              AppIcons.xIcon,
                                            ),
                                          ),
                                        )
                                      : const SizedBox(),
                                  const Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: AppColors.grey2,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    return const Center(
                      child: Text('Error'),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Text('Qo\'shimcha ma\'lumot'),
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
                maxLines: 5,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      width: 1,
                      color: AppColors.grey3,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      width: 1,
                      color: AppColors.grey3,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.green,
                    ),
                  ),
                  hintText: 'Shu yerga yozing...',
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
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: AppColors.green,
                  ),
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                    child: Text(
                      'Rasmiylashtirish',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
