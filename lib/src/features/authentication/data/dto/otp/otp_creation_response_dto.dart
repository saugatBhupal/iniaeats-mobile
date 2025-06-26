import 'package:json_annotation/json_annotation.dart';

part 'otp_creation_response_dto.g.dart';

@JsonSerializable()
class OtpCreationResponseDto {
  final String message;
  final String expiryTime;

  OtpCreationResponseDto({required this.message, required this.expiryTime});

  factory OtpCreationResponseDto.fromJson(Map<String, dynamic> json) =>
      _$OtpCreationResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OtpCreationResponseDtoToJson(this);
}
