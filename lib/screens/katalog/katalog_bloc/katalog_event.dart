part of 'katalog_bloc.dart';

@immutable
abstract class KatalogEvent {}

class GetKatalogEvent extends KatalogEvent {
  final int categoryId;
  final int size;
  GetKatalogEvent(this.categoryId,this.size);
}

// ignore: must_be_immutable
class PostBasketProductKatalogEvent extends KatalogEvent {
  final String productVariationId;
  int? count;
  PostBasketProductKatalogEvent({required this.productVariationId, this.count});
}
