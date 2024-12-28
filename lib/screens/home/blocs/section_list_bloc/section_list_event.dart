part of 'section_list_bloc.dart';

@immutable
sealed class SectionListEvent {}

class GetSectionListEvent extends SectionListEvent {
  GetSectionListEvent();
}
