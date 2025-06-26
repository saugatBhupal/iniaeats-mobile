import 'package:dartz/dartz.dart';
import 'package:inaeats/src/core/error/failure.dart';
import 'package:inaeats/src/core/shared_prefs.dart/user_shared_pref.dart';
import 'package:inaeats/src/features/authentication/data/datasources/remote/authentication_remote_datasource.dart';
import 'package:inaeats/src/features/authentication/data/dto/otp/otp_creation_response_dto.dart';
import 'package:inaeats/src/features/authentication/data/dto/otp/verify_otp_request_dto.dart';
import 'package:inaeats/src/features/authentication/data/dto/user/basic_user_details_with_token.dart';
import 'package:inaeats/src/features/authentication/data/dto/user/register_user_request_dto.dart';
import 'package:inaeats/src/features/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRemoteRepository implements AuthenticationRepository {
  final AuthenticationRemoteDatasource authenticationRemoteDatasource;

  AuthenticationRemoteRepository({required this.authenticationRemoteDatasource});
  @override
  Future<Either<Failure, OtpCreationResponseDto>> getOtp(String phone) async {
    try {
      final OtpCreationResponseDto res = await authenticationRemoteDatasource.getOtp(phone);
      return Right(res);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, BasicUserDetailsWithTokenDto>> verifyOtp(VerifyOtpRequestDto dto) async {
    try {
      final BasicUserDetailsWithTokenDto res = await authenticationRemoteDatasource.verifyOtp(dto);
      final UserSharedPref userSharedPref = UserSharedPref();
      userSharedPref.setUserToken(res.token);
      return Right(res);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, BasicUserDetailsWithTokenDto>> registerUser(
    RegisterUserRequestDto dto,
  ) async {
    try {
      final BasicUserDetailsWithTokenDto res = await authenticationRemoteDatasource.registerUser(
        dto,
      );
      final UserSharedPref userSharedPref = UserSharedPref();
      userSharedPref.setUserToken(res.token);
      return Right(res);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
