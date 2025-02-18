part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class GetUserProfile extends ProfileEvent {
  GetUserProfile();
}

class GetUserOrdersEvent extends ProfileEvent {
  GetUserOrdersEvent();
}

class PostOrderResponseEvent extends ProfileEvent {
  final int page;
  PostOrderResponseEvent({required this.page});
}
class ShowMoreOrderEvent extends ProfileEvent {
  final int page;
  ShowMoreOrderEvent({required this.page});
}
class PostFinishedOrderResponseEvent extends ProfileEvent {
  PostFinishedOrderResponseEvent();
}

class EditUserInfoEvent extends ProfileEvent {
  final String firstName;
  final String lastName;
  EditUserInfoEvent({required this.firstName, required this.lastName});
}
