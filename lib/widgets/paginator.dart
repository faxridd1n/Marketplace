import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/indicator.dart';
import 'package:formz/formz.dart';

class Paginator extends StatelessWidget {
  final FormzSubmissionStatus paginatorStatus;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final Widget Function(BuildContext context, int index)? separatorBuilder;
  final int itemCount;
  final VoidCallback fetchMoreFunction;
  final bool hasMoreToFetch;
  final Widget? errorWidget;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final Axis scrollDirection;
  final EdgeInsets? padding;
  final ScrollController? controller;

  const Paginator({
    required this.paginatorStatus,
    required this.itemBuilder,
    this.separatorBuilder,
    this.errorWidget,
    required this.itemCount,
    required this.fetchMoreFunction,
    required this.hasMoreToFetch,
    this.scrollDirection = Axis.vertical,
    this.shrinkWrap = false,
    this.padding,
    super.key,
    this.physics,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    if (paginatorStatus == FormzSubmissionStatus.inProgress) {
      return Center(
          child:CustomLoadingIndicator());
    } else if (paginatorStatus == FormzSubmissionStatus.failure) {
      return errorWidget ?? const SizedBox.shrink();
    } else if (paginatorStatus == FormzSubmissionStatus.success) {
      return ListView.separated(
        controller: controller,
        padding: padding,
        shrinkWrap: shrinkWrap,
        scrollDirection: scrollDirection,
        physics: physics ?? const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          if (index == itemCount) {
            if (hasMoreToFetch) {
              fetchMoreFunction();
              return Center(
                  child:CustomLoadingIndicator());
            } else {
              return const SizedBox();
            }
          }
          return itemBuilder(context, index);
        },
        itemCount: itemCount + 1,
        separatorBuilder:
            separatorBuilder ?? (context, index) => const SizedBox.shrink(),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
