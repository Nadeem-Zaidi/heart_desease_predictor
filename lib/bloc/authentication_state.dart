part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoadingIndicator extends AuthenticationState {}

class AuthenticationSignInScreen extends AuthenticationState {}

class AuthenticationSignUpScreen extends AuthenticationState {}

class AuthenticationVerifyPhone extends AuthenticationState {}

class AuthenticationOTPScreen extends AuthenticationState {}

class PhoneAuthInitial extends AuthenticationState {}

class PhoneAuthError extends AuthenticationState {
  final String error;

  const PhoneAuthError({required this.error});

  @override
  List<Object> get props => [error];
}

class PhoneAuthVerified extends AuthenticationState {}

class PhoneAuthCodeSentSuccess extends AuthenticationState {
  final String verificationId;
  const PhoneAuthCodeSentSuccess({
    required this.verificationId,
  });
  @override
  List<Object> get props => [verificationId];
}

class PhoneAuthLoading extends AuthenticationState {}

class LogoutState extends AuthenticationState {}
