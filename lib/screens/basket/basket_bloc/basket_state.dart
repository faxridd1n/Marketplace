part of 'basket_bloc.dart';

class BasketState extends Equatable {
  final BasketResponseModel? basketResponseModel;
  final FormzSubmissionStatus getBasketProductStatus;
  // final List<BasketProductElement> items;

  final BasketDeleteResModel? basketDeleteResModel;
  final FormzSubmissionStatus basketDeleteResStatus;
  final PostResponseBasketModel? postResponseBasketModel;
  final FormzSubmissionStatus postResponseBasketStatus;

  const BasketState(
      {this.basketResponseModel,
      this.getBasketProductStatus = FormzSubmissionStatus.initial,
      this.basketDeleteResModel,
      this.basketDeleteResStatus = FormzSubmissionStatus.initial,
      // required this.items,
       this.postResponseBasketModel,
    this.postResponseBasketStatus = FormzSubmissionStatus.initial,
      });

  BasketState copyWith({
    BasketResponseModel? basketResponseModel,
    FormzSubmissionStatus? getBasketProductStatus,
    BasketDeleteResModel? basketDeleteResModel,
    FormzSubmissionStatus? basketDeleteResStatus,
    // required List<BasketProductElement> items,
     PostResponseBasketModel? postResponseBasketModel,
    FormzSubmissionStatus? postResponseBasketStatus,
  }) {
    return BasketState(
      basketResponseModel: basketResponseModel ?? this.basketResponseModel,
      getBasketProductStatus:
          getBasketProductStatus ?? this.getBasketProductStatus,
      basketDeleteResModel: basketDeleteResModel ?? this.basketDeleteResModel,
      basketDeleteResStatus:
          basketDeleteResStatus ?? this.basketDeleteResStatus,
          // items: items,
           postResponseBasketModel:
          postResponseBasketModel ?? this.postResponseBasketModel,
      postResponseBasketStatus:
          postResponseBasketStatus ?? this.postResponseBasketStatus,
    );
  }

  @override
  List<Object?> get props => [
        basketResponseModel,
        getBasketProductStatus,
        basketDeleteResModel,
        basketDeleteResStatus,
         basketDeleteResModel,
        basketDeleteResStatus,
        // items
      ];
}
