part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<ProductModel>? parentCategoryModel;
  final FormzSubmissionStatus getProductStatus;
  final CategoryModel? categoryModel;
  final FormzSubmissionStatus getCategoryStatus;
  final List<OrganizationModel>? organizationModel;
  final FormzSubmissionStatus getOrganizationStatus;
  final PostResponseBasketModel? postResponseBasketModel;
  final FormzSubmissionStatus postResponseBasketStatus;

  const HomeState({
    this.parentCategoryModel,
    this.getProductStatus = FormzSubmissionStatus.initial,
    this.categoryModel,
    this.getCategoryStatus=FormzSubmissionStatus.initial,
    this.organizationModel,
    this.getOrganizationStatus=FormzSubmissionStatus.initial,
   this.postResponseBasketModel,
    this.postResponseBasketStatus = FormzSubmissionStatus.initial,
   
  });

  HomeState copyWith(
      {List<ProductModel>? parentCategoryModel,
      FormzSubmissionStatus? getProductStatus,
      CategoryModel? categoryModel,
      FormzSubmissionStatus? getCategoryStatus,
      List<OrganizationModel>? organizationModel,
      FormzSubmissionStatus? getOrganizationStatus,
       PostResponseBasketModel? postResponseBasketModel,
    FormzSubmissionStatus? postResponseBasketStatus,
      }) {
    return HomeState(
      parentCategoryModel: parentCategoryModel ?? this.parentCategoryModel,
      getProductStatus: getProductStatus ?? this.getProductStatus,
      categoryModel: categoryModel??this.categoryModel,
      getCategoryStatus: getCategoryStatus??this.getCategoryStatus,
      organizationModel: organizationModel??this.organizationModel,
      getOrganizationStatus: getOrganizationStatus??this.getOrganizationStatus,
      postResponseBasketModel:
          postResponseBasketModel ?? this.postResponseBasketModel,
      postResponseBasketStatus:
          postResponseBasketStatus ?? this.postResponseBasketStatus,
     
    );
  }

  @override
  List<Object?> get props => [
        parentCategoryModel,
        getProductStatus,
        categoryModel,
        getCategoryStatus,
        organizationModel,
        getOrganizationStatus,
        postResponseBasketModel,
        postResponseBasketStatus,
      ];
}
