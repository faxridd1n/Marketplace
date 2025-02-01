part of 'category_bloc.dart';

class CategoriesState extends Equatable {
  final CategoryModel categories;
  final FormzSubmissionStatus getCategoriesStatus;
  final String getCategoriesErrorMessage;

  const CategoriesState({
    this.categories = const CategoryModel(),
    this.getCategoriesStatus = FormzSubmissionStatus.initial,
    this.getCategoriesErrorMessage = '',
  });

  CategoriesState copyWith({
    CategoryModel? categories,
    FormzSubmissionStatus? getCategoriesStatus,
    String? getCategoriesErrorMessage,
  }) {
    return CategoriesState(
      categories: categories ?? this.categories,
      getCategoriesStatus: getCategoriesStatus ?? this.getCategoriesStatus,
      getCategoriesErrorMessage: getCategoriesErrorMessage ?? this.getCategoriesErrorMessage,
    );
  }

  @override
  List<Object> get props => [
        categories,
        getCategoriesStatus,
        getCategoriesErrorMessage,
      ];
}
