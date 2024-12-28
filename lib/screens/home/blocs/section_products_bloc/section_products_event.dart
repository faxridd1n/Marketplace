part of 'section_products_bloc.dart';

@immutable
sealed class SectionProductsEvent {}

class GetSectionProductsEvent extends SectionProductsEvent {
  final int sectionId;
  GetSectionProductsEvent(this.sectionId);
}
