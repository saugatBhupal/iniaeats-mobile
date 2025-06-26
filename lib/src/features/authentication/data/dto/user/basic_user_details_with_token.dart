import 'package:inaeats/src/core/models/remote/user_api_model.dart';

class BasicUserDetailsWithTokenDto {
  final String token;
  final UserApiModel user;

  BasicUserDetailsWithTokenDto({required this.token, required this.user});

  factory BasicUserDetailsWithTokenDto.fromJson(Map<String, dynamic> json) {
    final detail = json['detail'] as Map<String, dynamic>;
    return BasicUserDetailsWithTokenDto(
      token: detail['token'] ?? '',
      user: UserApiModel.fromJson(detail),
    );
  }
}
