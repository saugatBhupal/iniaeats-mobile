import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inaeats/src/features/authentication/data/dto/user/basic_user_details_with_token.dart';
import 'package:inaeats/src/features/authentication/data/dto/otp/otp_creation_response_dto.dart';
import 'package:inaeats/src/features/authentication/data/dto/otp/verify_otp_request_dto.dart';
import 'package:inaeats/src/features/authentication/data/dto/user/register_user_request_dto.dart';
import 'package:inaeats/src/features/authentication/domain/usecases/get_otp_usecase.dart';
import 'package:inaeats/src/features/authentication/domain/usecases/register_user_usecase.dart';
import 'package:inaeats/src/features/authentication/domain/usecases/verify_otp_usecase.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final GetOtpUsecase getOtpUsecase;
  final VerifyOtpUsecase verifyOtpUsecase;
  final RegisterUserUsecase registerUserUsecase;
  AuthenticationBloc({
    required this.getOtpUsecase,
    required this.verifyOtpUsecase,
    required this.registerUserUsecase,
  }) : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) async {
      if (event is GetOtp) {
        await _getOtp(event, emit);
      }
      if (event is VerifyOtp) {
        await _verifyOtp(event, emit);
      }
      if (event is RegisterUser) {
        await _registerUser(event, emit);
      }
    });
  }

  Future<void> _getOtp(GetOtp event, Emitter<AuthenticationState> emit) async {
    emit(const GetOtpLoading());
    final result = await getOtpUsecase(event.phone);
    result.fold(
      (failure) => emit(GetOtpError(message: failure.message)),
      (success) => emit(GetOtpSuccess(dto: success)),
    );
  }

  Future<void> _verifyOtp(VerifyOtp event, Emitter<AuthenticationState> emit) async {
    emit(const VerifyOtpLoading());
    final result = await verifyOtpUsecase(event.dto);
    result.fold(
      (failure) => emit(
        VerifyOtpError(
          message:
              failure.message.contains(":")
                  ? failure.message.split(": ").sublist(1).join(": ").trim()
                  : failure.message,
        ),
      ),
      (success) => emit(VerifyOtpSuccess(dto: success)),
    );
  }

  Future<void> _registerUser(RegisterUser event, Emitter<AuthenticationState> emit) async {
    emit(const RegisterUserLoading());
    final result = await registerUserUsecase(event.dto);
    result.fold(
      (failure) => emit(RegisterUserError(message: failure.message)),
      (success) => emit(RegisterUserSuccess(dto: success)),
    );
  }
}
