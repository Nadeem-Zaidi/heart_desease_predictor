part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class ESignIn extends AuthenticationEvent {}

class ESignUp extends AuthenticationEvent {}

class SendPhoneNumber extends AuthenticationEvent {
  final String phoneNumber;

  SendPhoneNumber({required this.phoneNumber});

  String get phone {
    return phoneNumber;
  }
}

class VerifyOTP extends AuthenticationEvent {
  final String otpCode;
  VerifyOTP({required this.otpCode});
}

class SendOtpToPhoneEvent extends AuthenticationEvent {
  final String phoneNumber;

  const SendOtpToPhoneEvent({required this.phoneNumber});
  @override
  List<Object> get props => [phoneNumber];
}

class VerifySentOtpEvent extends AuthenticationEvent {
  final String otpCode;

  const VerifySentOtpEvent({required this.otpCode});

  @override
  List<Object> get props => [otpCode];
}

class OnPhoneOtpSent extends AuthenticationEvent {
  final String verificationId;
  final int? token;
  const OnPhoneOtpSent({
    required this.verificationId,
    required this.token,
  });

  @override
  List<Object> get props => [verificationId];
}

class OnPhoneAuthErrorEvent extends AuthenticationEvent {
  final String error;
  const OnPhoneAuthErrorEvent({required this.error});

  @override
  List<Object> get props => [error];
}

class OnPhoneAuthVerificationCompleteEvent extends AuthenticationEvent {
  final AuthCredential credential;
  const OnPhoneAuthVerificationCompleteEvent({
    required this.credential,
  });
}

class LogoutEvent extends AuthenticationEvent {}
