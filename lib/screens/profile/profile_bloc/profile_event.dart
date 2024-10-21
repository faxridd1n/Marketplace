part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

// ignore: must_be_immutable
class GetUserProfile extends ProfileEvent {
  GetUserProfile();
}
