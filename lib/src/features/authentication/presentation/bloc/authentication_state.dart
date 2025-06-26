part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {}

class GetOtpLoading extends AuthenticationState {
  const GetOtpLoading();
}

class GetOtpSuccess extends AuthenticationState {
  final OtpCreationResponseDto dto;

  const GetOtpSuccess({required this.dto});
}

class GetOtpError extends AuthenticationState {
  final String message;

  const GetOtpError({required this.message});
}

class VerifyOtpLoading extends AuthenticationState {
  const VerifyOtpLoading();
}

class VerifyOtpSuccess extends AuthenticationState {
  final BasicUserDetailsWithTokenDto dto;

  const VerifyOtpSuccess({required this.dto});
}

class VerifyOtpError extends AuthenticationState {
  final String message;

  const VerifyOtpError({required this.message});
}
class RegisterUserLoading extends AuthenticationState {
  const RegisterUserLoading();
}

class RegisterUserSuccess extends AuthenticationState {
  final BasicUserDetailsWithTokenDto dto;

  const RegisterUserSuccess({required this.dto});
}

class RegisterUserError extends AuthenticationState {
  final String message;

  const RegisterUserError({required this.message});
}
