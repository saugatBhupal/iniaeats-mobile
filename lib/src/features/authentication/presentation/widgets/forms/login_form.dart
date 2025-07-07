import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inaeats/src/core/constants/app_enums.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/core/functions/build_toast.dart';
import 'package:inaeats/src/core/utils/form_validator.dart';
import 'package:inaeats/src/core/widgets/input/country_dropdown.dart';
import 'package:inaeats/src/core/widgets/input/dropdown_input.dart';
import 'package:inaeats/src/core/widgets/input/phone_field.dart';
import 'package:inaeats/src/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:inaeats/src/features/authentication/presentation/widgets/auth_button.dart';
import 'package:inaeats/src/features/authentication/presentation/widgets/input_label.dart';

class LoginForm extends StatefulWidget {
  final void Function(String phone, String expiryTime) onOtpRequested;

  const LoginForm({super.key, required this.onOtpRequested});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _phoneController;
  final ValueNotifier<bool> isPhoneFilled = ValueNotifier(false);
  final List<String> cities = ["Kathmandu", "Pokhara"];
  String selectedCity = "Kathmandu";

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();

    _phoneController.addListener(() {
      isPhoneFilled.value = TextUtils.isValidPhoneNumber(_phoneController.text);
    });
  }

  @override
  void dispose() {
    _phoneController.dispose();
    isPhoneFilled.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is GetOtpSuccess) {
          buildToast(toastType: ToastType.success, msg: "OTP Added Successfully");
          widget.onOtpRequested(_phoneController.text, state.dto.expiryTime);
        }
        if (state is GetOtpError) {
          buildToast(toastType: ToastType.error, msg: "OTP Error");
          widget.onOtpRequested(_phoneController.text, '');
        }
      },
      child: SingleChildScrollView(
        child: SizedBox(
          height: context.height / 2.5,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputLabel(label: "Select country and city"),
                  Padding(
                    padding: EdgeInsets.only(top: 4, bottom: 12),
                    child: Row(
                      children: [
                        Flexible(flex: 2, child: CountryDropdown()),
                        const SizedBox(width: 10),
                        Flexible(
                          flex: 3,
                          child: DropdownInput(
                            label: selectedCity,
                            title: "City",
                            options: cities,
                            onSelected: (value) {
                              setState(() => selectedCity = value);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  PhoneField(
                    controller: _phoneController,
                    label: AppStrings.phoneLabel,
                    validator: (val) {
                      return FormValidator.validateTitle(val, AppStrings.phone);
                    },
                  ),
                  SizedBox(height: 32),
                  ValueListenableBuilder<bool>(
                    valueListenable: isPhoneFilled,
                    builder: (context, isEnabled, _) {
                      return AuthButton(
                        title: AppStrings.requestOTP,
                        onPressed:
                            isEnabled
                                ? () {
                                  if (_formKey.currentState!.validate()) {
                                    // widget.onOtpRequested();
                                    context.read<AuthenticationBloc>().add(
                                      GetOtp(phone: _phoneController.text),
                                    );
                                  }
                                }
                                : null,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
