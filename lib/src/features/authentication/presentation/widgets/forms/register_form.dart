import 'package:flutter/material.dart';
import 'package:inaeats/src/config/app_routes/app_routes.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/core/utils/form_validator.dart';
import 'package:inaeats/src/core/widgets/buttons/dark_rounded_button.dart';
import 'package:inaeats/src/core/widgets/input/date_field.dart';
import 'package:inaeats/src/core/widgets/input/dropdown_input.dart';
import 'package:inaeats/src/core/widgets/input/email_field.dart';
import 'package:inaeats/src/core/widgets/input/input_field.dart';
import 'package:inaeats/src/features/authentication/presentation/widgets/input_label.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _dobController;

  String selectedGender = AppStrings.male;
  final List<String> genderOptions = [AppStrings.male, AppStrings.female];

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
    return Container(
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
              validator:
                  (value) => FormValidator.validateTitle(value, "Full Name"),
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
                          label: selectedGender,
                          title: AppStrings.gender,
                          options: genderOptions,
                          onSelected: (value) {
                            setState(() => selectedGender = value);
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
                      validator:
                          (value) => FormValidator.validateTitle(
                            value,
                            AppStrings.dob,
                          ),
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
                  Navigator.of(context).pushNamed(AppRoutes.home);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
