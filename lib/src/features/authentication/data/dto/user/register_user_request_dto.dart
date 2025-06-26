import 'package:inaeats/src/core/constants/app_enums.dart';
import 'package:intl/intl.dart';

class RegisterUserRequestDto {
  final String fullname;
  final String phone;
  final String email;
  final Gender gender;
  final DateTime dob;

  RegisterUserRequestDto({
    required this.fullname,
    required this.phone,
    required this.email,
    required this.gender,
    required this.dob,
  });

  Map<String, dynamic> toJson() {
    return {
      "fullname": fullname,
      "phone": phone,
      "email": email,
      "gender": gender.name.toUpperCase(),
      "dob": DateFormat('yyyy-MM-dd').format(dob),
    };
  }
}
