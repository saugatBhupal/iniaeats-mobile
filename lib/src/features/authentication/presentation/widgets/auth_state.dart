import 'package:inaeats/src/core/constants/app_enums.dart';

class AuthState {
  final AuthType authType;
  final String phone;
  final String expiryTime;

  AuthState({required this.authType, this.phone = '', this.expiryTime = ''});

  AuthState copyWith({AuthType? authType, String? phone, String? expiryTime}) {
    return AuthState(
      authType: authType ?? this.authType,
      phone: phone ?? this.phone,
      expiryTime: expiryTime ?? this.expiryTime,
    );
  }
}
