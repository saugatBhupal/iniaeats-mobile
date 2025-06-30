import 'package:equatable/equatable.dart';
import 'package:inaeats/src/core/constants/app_enums.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class User extends Equatable {
  final String id;
  final String fullname;
  final String email;
  final String phone;
  final Gender gender;
  final DateTime dob;
  final int age;
  final UserType useType;
  final String otp;
  final DateTime otpExpireTime;
  final bool hasRegistered;
  final Role userRole;

  const User({
    required this.id,
    required this.fullname,
    required this.email,
    required this.phone,
    required this.gender,
    required this.dob,
    required this.age,
    required this.useType,
    required this.otp,
    required this.otpExpireTime,
    required this.hasRegistered,
    required this.userRole,
  });

  factory User.initial() => User(
    id: Uuid().v4(),
    fullname: '',
    email: '',
    phone: '',
    gender: Gender.male,
    dob: DateTime(2000, 1, 1),
    age: 18,
    useType: UserType.user,
    otp: '',
    otpExpireTime: DateTime.now(),
    hasRegistered: false,
    userRole: Role.user,
  );

  User copyWith({
    String? id,
    String? fullname,
    String? email,
    String? phone,
    Gender? gender,
    DateTime? dob,
    int? age,
    UserType? useType,
    String? otp,
    DateTime? otpExpireTime,
    bool? hasRegistered,
    Role? userRole,
  }) {
    return User(
      id: id ?? this.id,
      fullname: fullname ?? this.fullname,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
      age: age ?? this.age,
      useType: useType ?? this.useType,
      otp: otp ?? this.otp,
      otpExpireTime: otpExpireTime ?? this.otpExpireTime,
      hasRegistered: hasRegistered ?? this.hasRegistered,
      userRole: userRole ?? this.userRole,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String? ?? '',
      fullname: json['fullname'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      gender: Gender.values.firstWhere(
        (e) => e.name == (json['gender'] as String?)?.toLowerCase(),
        orElse: () => Gender.male,
      ),
      dob: json['dob'] != null ? DateFormat('dd-MM-yyyy').parse(json['dob']) : DateTime(2000, 1, 1),
      age: json['age'] as int? ?? 18,
      useType: UserType.values.firstWhere(
        (e) => e.name == (json['userType'] as String?)?.toLowerCase(),
        orElse: () => UserType.user,
      ),
      otp: json['otp'] as String? ?? '',
      otpExpireTime:
          json['otpExpireTime'] != null ? DateTime.parse(json['otpExpireTime']) : DateTime.now(),
      hasRegistered: json['hasRegistered'] as bool? ?? false,
      userRole: Role.values.firstWhere(
        (e) => e.name == (json['userRole'] as String?)?.toLowerCase(),
        orElse: () => Role.user,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullname': fullname,
      'email': email,
      'phone': phone,
      'gender': gender.name,
      'dob': DateFormat('dd-MM-yyyy').format(dob),
      'age': age,
      'userType': useType.name,
      'otp': otp,
      'otpExpireTime': otpExpireTime.toIso8601String(),
      'hasRegistered': hasRegistered,
      'userRole': userRole.name,
    };
  }

  String get formattedDob => DateFormat('d MMMM y').format(dob);

  bool get isOtpExpired => DateTime.now().isAfter(otpExpireTime);
  @override
  List<Object?> get props => [];
}
