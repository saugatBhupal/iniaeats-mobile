// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_creation_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpCreationResponseDto _$OtpCreationResponseDtoFromJson(
        Map<String, dynamic> json) =>
    OtpCreationResponseDto(
      message: json['message'] as String,
      expiryTime: json['expiryTime'] as String,
    );

Map<String, dynamic> _$OtpCreationResponseDtoToJson(
        OtpCreationResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'expiryTime': instance.expiryTime,
    };
