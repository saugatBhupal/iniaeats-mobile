import 'package:dartz/dartz.dart';
import 'package:inaeats/src/core/domain/usecases/base_usecase.dart';
import 'package:inaeats/src/core/error/failure.dart';
import 'package:inaeats/src/features/authentication/data/dto/otp/otp_creation_response_dto.dart';
import 'package:inaeats/src/features/authentication/domain/repositories/authentication_repository.dart';

class GetOtpUsecase implements UsecaseWithParams<OtpCreationResponseDto, String> {
  final AuthenticationRepository authenticationRepository;

  GetOtpUsecase({required this.authenticationRepository});

  @override
  Future<Either<Failure, OtpCreationResponseDto>> call(String params) {
    return authenticationRepository.getOtp(params);
  }
}
