import 'package:inaeats/src/core/domain/entities/user.dart';
import 'package:inaeats/src/core/models/remote/user_api_model.dart';

extension UserApiModelExtension on UserApiModel {
  User toDomain() => User.initial().copyWith(
    id: id,
    fullname: fullname,
    email: email,
    phone: phone,
    gender: gender,
    dob: dob,
    age: age,
    useType: useType,
    otp: otp,
    otpExpireTime: otpExpireTime,
    hasRegistered: hasRegistered,
    userRole: userRole,
  );
}

extension UserExtension on User {
  UserApiModel toApiModel() => UserApiModel(
    id: id,
    fullname: fullname,
    email: email,
    phone: phone,
    gender: gender,
    dob: dob,
    age: age,
    useType: useType,
    otp: otp,
    otpExpireTime: otpExpireTime,
    hasRegistered: hasRegistered,
    userRole: userRole,
  );
}
