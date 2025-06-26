import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';
import 'package:inaeats/src/core/widgets/buttons/dark_rounded_button.dart';
import 'package:intl/intl.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';

class DateField extends StatefulWidget {
  final String label;
  final String? hintText;
  final TextEditingController controller;
  final FormFieldValidator<String?> validator;

  const DateField({
    super.key,
    required this.label,
    this.hintText,
    required this.controller,
    required this.validator,
  });

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  DateTime? selectedDate;

  void _showDatePicker(BuildContext context) {
    DateTime tempDate = selectedDate ?? DateTime.now();

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      builder: (_) {
        return Container(
          height: context.height / 2.4,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.white, AppColors.dew],
            ),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Container(
                  width: context.width,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: AppColors.border)),
                  ),
                  child: Text(
                    "Choose Date",
                    style: context.titleLarge.copyWith(
                      fontWeight: FontThickness.semiBold,
                      color: AppColors.green,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: selectedDate ?? DateTime.now(),
                  minimumDate: DateTime(1970, 1, 1),
                  minimumYear: 1950,
                  maximumYear: DateTime.now().year,
                  dateOrder: DatePickerDateOrder.dmy,
                  onDateTimeChanged: (DateTime date) {
                    tempDate = date;
                  },
                ),
              ),
              SafeArea(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 42.0),
                  child: DarkRoundedButton(
                    title: "Done",
                    onPressed: () {
                      setState(() {
                        selectedDate = tempDate;
                        widget.controller.text = DateFormat('d MMMM y').format(selectedDate!);
                      });
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: context.bodySmall!.copyWith(color: AppColors.black.withValues(alpha: 0.6)),
        ),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: () => _showDatePicker(context),
          child: AbsorbPointer(
            child: TextFormField(
              readOnly: true,
              controller: widget.controller,
              validator: widget.validator,
              keyboardType: TextInputType.datetime,
              cursorColor: AppColors.grey,
              style: context.titleSmall!.copyWith(color: AppColors.black.withValues(alpha: 0.6)),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                hintText:
                    selectedDate != null
                        ? DateFormat('d MMMM y').format(selectedDate!)
                        : widget.hintText ?? 'Select date',
                hintStyle: context.titleSmall!.copyWith(
                  fontSize: 15,
                  color: AppColors.black.withValues(alpha: 0.6),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColors.grey.withValues(alpha: 0.4)),
                ),
                filled: true,
                fillColor: AppColors.grey.withValues(alpha: 0.05),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: SvgPicture.asset(AppIcons.calender),
                ),
                suffixIconConstraints: const BoxConstraints(minHeight: 22, minWidth: 22),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
