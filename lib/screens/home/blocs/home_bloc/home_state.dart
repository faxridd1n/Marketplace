part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<OrganizationModel> organizationModel;
  final FormzSubmissionStatus getOrganizationStatus;
  final PostResponseBasketModel postResponseBasketModel;
  final FormzSubmissionStatus postResponseBasketStatus;


  const HomeState({
    this.organizationModel = const [],
    this.getOrganizationStatus = FormzSubmissionStatus.initial,
    this.postResponseBasketModel = const PostResponseBasketModel(),
    this.postResponseBasketStatus = FormzSubmissionStatus.initial,
  });

  HomeState copyWith({
    List<OrganizationModel>? organizationModel,
    FormzSubmissionStatus? getOrganizationStatus,
    PostResponseBasketModel? postResponseBasketModel,
    FormzSubmissionStatus? postResponseBasketStatus,
  }) {
    return HomeState(
      organizationModel: organizationModel ?? this.organizationModel,
      getOrganizationStatus:
      getOrganizationStatus ?? this.getOrganizationStatus,
      postResponseBasketModel:
      postResponseBasketModel ?? this.postResponseBasketModel,
      postResponseBasketStatus:
      postResponseBasketStatus ?? this.postResponseBasketStatus,
    );
  }


  @override
  List<Object> get props =>
      [
        organizationModel,
        getOrganizationStatus,
        postResponseBasketModel,
        postResponseBasketStatus,
      ];
}