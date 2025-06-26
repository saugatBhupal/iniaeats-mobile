import 'package:inaeats/src/features/authentication/data/dto/otp/otp_creation_response_dto.dart';
import 'package:inaeats/src/features/authentication/data/dto/otp/verify_otp_request_dto.dart';
import 'package:inaeats/src/features/authentication/data/dto/user/basic_user_details_with_token.dart';
import 'package:inaeats/src/features/authentication/data/dto/user/register_user_request_dto.dart';

abstract class AuthenticationRemoteDatasource {
  Future<OtpCreationResponseDto> getOtp(String phone);
  Future<BasicUserDetailsWithTokenDto> verifyOtp(VerifyOtpRequestDto dto);
  Future<BasicUserDetailsWithTokenDto> registerUser(RegisterUserRequestDto dto);
}
