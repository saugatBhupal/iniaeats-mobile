import 'package:dio/dio.dart';
import 'package:inaeats/src/core/error/failure.dart';
import 'package:inaeats/src/core/http/api_endpoints.dart';
import 'package:inaeats/src/core/http/handle_error_response.dart';
import 'package:inaeats/src/features/authentication/data/datasources/remote/authentication_remote_datasource.dart';
import 'package:inaeats/src/features/authentication/data/dto/otp/otp_creation_response_dto.dart';
import 'package:inaeats/src/features/authentication/data/dto/otp/verify_otp_request_dto.dart';
import 'package:inaeats/src/features/authentication/data/dto/user/basic_user_details_with_token.dart';
import 'package:inaeats/src/features/authentication/data/dto/user/register_user_request_dto.dart';

class AuthenticationRemoteDatasourceImpl implements AuthenticationRemoteDatasource {
  final Dio dio;

  AuthenticationRemoteDatasourceImpl({required this.dio});
  @override
  Future<OtpCreationResponseDto> getOtp(String phone) async {
    try {
      var res = await dio.post(ApiEndpoints.getOtp, data: {'phone': phone});
      if (res.statusCode == 200) {
        final OtpCreationResponseDto responseDto = OtpCreationResponseDto.fromJson(
          res.data['detail'],
        );
        return responseDto;
      } else {
        throw Failure(message: res.statusMessage.toString(), statusCode: res.statusCode.toString());
      }
    } on DioException catch (e) {
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<BasicUserDetailsWithTokenDto> verifyOtp(VerifyOtpRequestDto dto) async {
    try {
      final formData = FormData.fromMap({'phone': dto.phone, 'otp': dto.otp});
      var res = await dio.post(ApiEndpoints.verifyOtp, data: formData);
      if (res.statusCode == 200) {
        final BasicUserDetailsWithTokenDto responseDto = BasicUserDetailsWithTokenDto.fromJson(
          res.data,
        );
        return responseDto;
      } else {
        throw Failure(message: res.statusMessage.toString(), statusCode: res.statusCode.toString());
      }
    } on DioException catch (e) {
      return await handleErrorResponse(e);
    }
  }

  @override
  Future<BasicUserDetailsWithTokenDto> registerUser(RegisterUserRequestDto dto) async {
    try {
      var res = await dio.post(ApiEndpoints.register, data: dto.toJson());
      if (res.statusCode == 200) {
        final BasicUserDetailsWithTokenDto responseDto = BasicUserDetailsWithTokenDto.fromJson(
          res.data,
        );
        return responseDto;
      } else {
        throw Failure(message: res.statusMessage.toString(), statusCode: res.statusCode.toString());
      }
    } on DioException catch (e) {
      return await handleErrorResponse(e);
    }
  }
}
