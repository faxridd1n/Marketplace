part of 'home_bloc.dart';

class HomeState extends Equatable {
  final FormzSubmissionStatus getTabsStatus;
  final TabsModel? tabsModel;
  final CategoryModel? categoryModel;
  final FormzSubmissionStatus getCategoryStatus;
  final List<OrganizationModel>? organizationModel;
  final FormzSubmissionStatus getOrganizationStatus;
  final PostResponseBasketModel? postResponseBasketModel;
  final FormzSubmissionStatus postResponseBasketStatus;
  final List<ProductModel>? productModel1;
  final FormzSubmissionStatus getProductStatus;

  const HomeState({
    this.getTabsStatus = FormzSubmissionStatus.initial,
    this.tabsModel,
    this.getProductStatus = FormzSubmissionStatus.initial,
    this.categoryModel,
    this.getCategoryStatus = FormzSubmissionStatus.initial,
    this.organizationModel,
    this.getOrganizationStatus = FormzSubmissionStatus.initial,
    this.postResponseBasketModel,
    this.postResponseBasketStatus = FormzSubmissionStatus.initial,
    this.productModel1,
  });

  HomeState copyWith({
    FormzSubmissionStatus? getTabsStatus,
    TabsModel? tabsModel,
    FormzSubmissionStatus? getProductStatus,
    CategoryModel? categoryModel,
    FormzSubmissionStatus? getCategoryStatus,
    List<OrganizationModel>? organizationModel,
    FormzSubmissionStatus? getOrganizationStatus,
    PostResponseBasketModel? postResponseBasketModel,
    FormzSubmissionStatus? postResponseBasketStatus,
    List<ProductModel>? productModel1,
  }) {
    return HomeState(
      getTabsStatus: getTabsStatus ?? this.getTabsStatus,
      tabsModel: tabsModel ?? this.tabsModel,
      getProductStatus: getProductStatus ?? this.getProductStatus,
      categoryModel: categoryModel ?? this.categoryModel,
      getCategoryStatus: getCategoryStatus ?? this.getCategoryStatus,
      organizationModel: organizationModel ?? this.organizationModel,
      getOrganizationStatus:
          getOrganizationStatus ?? this.getOrganizationStatus,
      postResponseBasketModel:
          postResponseBasketModel ?? this.postResponseBasketModel,
      postResponseBasketStatus:
          postResponseBasketStatus ?? this.postResponseBasketStatus,
      productModel1: productModel1 ?? this.productModel1,
    );
  }

  @override
  List<Object?> get props => [
        getTabsStatus,
        tabsModel,
        getProductStatus,
        categoryModel,
        getCategoryStatus,
        organizationModel,
        getOrganizationStatus,
        postResponseBasketModel,
        postResponseBasketStatus,
        productModel1,
      ];
}
