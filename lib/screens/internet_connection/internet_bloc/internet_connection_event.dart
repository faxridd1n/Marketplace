part of 'internet_connection_bloc.dart';

@immutable
abstract class InternetConnectionEvent {}

class InternetStatusChanged extends InternetConnectionEvent {
  final List<ConnectivityResult> results;
  InternetStatusChanged({required this.results});
}
