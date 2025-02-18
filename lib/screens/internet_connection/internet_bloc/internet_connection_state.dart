part of 'internet_connection_bloc.dart';

class InternetConnectionState extends Equatable {
  final FormzSubmissionStatus internetStatus;

  const InternetConnectionState({
    this.internetStatus = FormzSubmissionStatus.initial,
  });

  InternetConnectionState copyWith({
    FormzSubmissionStatus? internetStatus,
  }) {
    return InternetConnectionState(
      internetStatus: internetStatus ?? this.internetStatus,
    );
  }

  @override
  List<Object> get props => [
        internetStatus,
      ];
}
