part of 'section_list_bloc.dart';

class SectionListState extends Equatable {
  final TabsModel tabModel;
  final FormzSubmissionStatus getTabsStatus;
  final String getTabsErrorMessage;

  const SectionListState({
    this.tabModel = const TabsModel(),
    this.getTabsStatus = FormzSubmissionStatus.initial,
    this.getTabsErrorMessage = '',
  });

  SectionListState copyWith({
    TabsModel? tabModel,
    FormzSubmissionStatus? getTabsStatus,
    String? getTabsErrorMessage,
  }) {
    return SectionListState(
      tabModel: tabModel ?? this.tabModel,
      getTabsStatus: getTabsStatus ?? this.getTabsStatus,
      getTabsErrorMessage: getTabsErrorMessage ?? this.getTabsErrorMessage,
    );
  }

  @override
  List<Object> get props => [
        tabModel,
        getTabsStatus,
        getTabsErrorMessage,
      ];
}

