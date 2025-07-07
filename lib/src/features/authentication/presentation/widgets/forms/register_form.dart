import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inaeats/src/config/app_routes/app_routes.dart';
import 'package:inaeats/src/core/constants/app_enums.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/core/functions/build_toast.dart';
import 'package:inaeats/src/core/utils/form_validator.dart';
import 'package:inaeats/src/core/widgets/buttons/dark_rounded_button.dart';
import 'package:inaeats/src/core/widgets/input/date_field.dart';
import 'package:inaeats/src/core/widgets/input/dropdown_input.dart';
import 'package:inaeats/src/core/widgets/input/email_field.dart';
import 'package:inaeats/src/core/widgets/input/input_field.dart';
import 'package:inaeats/src/core/widgets/snackbar/app_snackbar_alert.dart';
import 'package:inaeats/src/features/authentication/data/dto/user/register_user_request_dto.dart';
import 'package:inaeats/src/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:inaeats/src/features/authentication/presentation/widgets/input_label.dart';
import 'package:intl/intl.dart';

class RegisterForm extends StatefulWidget {
  final String phone;
  const RegisterForm({super.key, required this.phone});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _dobController;

  Gender selectedGender = Gender.male;
  final List<String> genderOptions =
      Gender.values.map((g) => '${g.name[0].toUpperCase()}${g.name.substring(1)}').toList();
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _dobController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is RegisterUserSuccess) {
          showCustomAlertOverlay(context, type: AlertType.welcome);
          Navigator.of(context).pushNamed(AppRoutes.home);
        }
        if (state is RegisterUserError) {
          buildToast(toastType: ToastType.success, msg: state.message);
        }
      },
      child: SingleChildScrollView(
        child: Container(
          height: context.height / 1.55,
          padding: EdgeInsets.symmetric(vertical: 28),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputField(
                  label: AppStrings.nameLabel,
                  controller: _nameController,
                  validator: (value) => FormValidator.validateTitle(value, "Full Name"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: EmailField(
                    label: AppStrings.emailLabel,
                    controller: _emailController,
                    validator: (value) => FormValidator.validateEmail(value),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 6, bottom: 12),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InputLabel(label: AppStrings.gender),
                            DropdownInput(
                              label:
                                  '${selectedGender.name[0].toUpperCase()}${selectedGender.name.substring(1)}',
                              title: AppStrings.gender,
                              options: genderOptions,
                              onSelected: (String value) {
                                setState(() {
                                  selectedGender = Gender.values.firstWhere(
                                    (g) =>
                                        '${g.name[0].toUpperCase()}${g.name.substring(1)}' == value,
                                  );
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Flexible(
                        flex: 4,
                        child: DateField(
                          label: AppStrings.dob,
                          controller: _dobController,
                          validator: (value) => FormValidator.validateTitle(value, AppStrings.dob),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 22),
                DarkRoundedButton(
                  title: AppStrings.contin,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print("Phone ${widget.phone}");
                      context.read<AuthenticationBloc>().add(
                        RegisterUser(
                          dto: RegisterUserRequestDto(
                            fullname: _nameController.text,
                            phone: widget.phone,
                            email: _emailController.text,
                            gender: selectedGender,
                            dob: DateFormat("d MMMM yyyy").parse(_dobController.text),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
