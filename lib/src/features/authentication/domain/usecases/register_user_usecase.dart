import 'package:dartz/dartz.dart';
import 'package:inaeats/src/core/domain/usecases/base_usecase.dart';
import 'package:inaeats/src/core/error/failure.dart';
import 'package:inaeats/src/features/authentication/data/dto/user/basic_user_details_with_token.dart';
import 'package:inaeats/src/features/authentication/data/dto/user/register_user_request_dto.dart';
import 'package:inaeats/src/features/authentication/domain/repositories/authentication_repository.dart';

class RegisterUserUsecase
    implements UsecaseWithParams<BasicUserDetailsWithTokenDto, RegisterUserRequestDto> {
  final AuthenticationRepository authenticationRepository;

  RegisterUserUsecase({required this.authenticationRepository});
  @override
  Future<Either<Failure, BasicUserDetailsWithTokenDto>> call(RegisterUserRequestDto dto) {
    return authenticationRepository.registerUser(dto);
  }
}
