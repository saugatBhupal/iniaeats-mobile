import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_request_dto.g.dart';

@JsonSerializable()
class VerifyOtpRequestDto {
  final String phone;
  final String otp;

  VerifyOtpRequestDto({required this.phone, required this.otp});

  factory VerifyOtpRequestDto.fromJson(Map<String, dynamic> json) => _$VerifyOtpRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyOtpRequestDtoToJson(this);
}
