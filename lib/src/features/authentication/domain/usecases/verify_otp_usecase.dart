import 'package:dartz/dartz.dart';
import 'package:inaeats/src/core/domain/usecases/base_usecase.dart';
import 'package:inaeats/src/core/error/failure.dart';
import 'package:inaeats/src/features/authentication/data/dto/otp/verify_otp_request_dto.dart';
import 'package:inaeats/src/features/authentication/data/dto/user/basic_user_details_with_token.dart';
import 'package:inaeats/src/features/authentication/domain/repositories/authentication_repository.dart';

class VerifyOtpUsecase
    implements UsecaseWithParams<BasicUserDetailsWithTokenDto, VerifyOtpRequestDto> {
  final AuthenticationRepository authenticationRepository;

  VerifyOtpUsecase({required this.authenticationRepository});

  @override
  Future<Either<Failure, BasicUserDetailsWithTokenDto>> call(VerifyOtpRequestDto dto) {
    return authenticationRepository.verifyOtp(dto);
  }
}
