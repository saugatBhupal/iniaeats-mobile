import 'package:dartz/dartz.dart';
import 'package:inaeats/src/core/error/failure.dart';
import 'package:inaeats/src/features/authentication/data/dto/otp/otp_creation_response_dto.dart';
import 'package:inaeats/src/features/authentication/data/dto/otp/verify_otp_request_dto.dart';
import 'package:inaeats/src/features/authentication/data/dto/user/basic_user_details_with_token.dart';
import 'package:inaeats/src/features/authentication/data/dto/user/register_user_request_dto.dart';

abstract interface class AuthenticationRepository {
  Future<Either<Failure, OtpCreationResponseDto>> getOtp(String phone);
  Future<Either<Failure, BasicUserDetailsWithTokenDto>> verifyOtp(VerifyOtpRequestDto dto);
  Future<Either<Failure, BasicUserDetailsWithTokenDto>> registerUser(RegisterUserRequestDto dto);
}
