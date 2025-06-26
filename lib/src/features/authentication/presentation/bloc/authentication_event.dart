part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class GetOtp extends AuthenticationEvent {
  final String phone;

  const GetOtp({required this.phone});

  @override
  List<Object> get props => [phone];
}

class VerifyOtp extends AuthenticationEvent {
  final VerifyOtpRequestDto dto;

  const VerifyOtp({required this.dto});

  @override
  List<Object> get props => [dto];
}

class RegisterUser extends AuthenticationEvent {
  final RegisterUserRequestDto dto;

  const RegisterUser({required this.dto});

  @override
  List<Object> get props => [dto];
}
