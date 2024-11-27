part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class GetUserProfile extends ProfileEvent {
  GetUserProfile();
}

class GetUserOrdersEvent extends ProfileEvent {
  GetUserOrdersEvent();
}

class EditUserInfoEvent extends ProfileEvent {
  final String firstName;
  final String lastName;
  EditUserInfoEvent({required this.firstName, required this.lastName});
}
