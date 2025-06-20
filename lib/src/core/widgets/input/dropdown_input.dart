import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_fonts.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class DropdownInput extends StatelessWidget {
  final String label;
  final String title;
  final List<String> options;
  final ValueChanged<String> onSelected;

  const DropdownInput({
    super.key,
    required this.label,
    required this.title,
    required this.options,
    required this.onSelected,
  });
  void _openBottomSheet(BuildContext context) async {
    String tempSelected = label;

    final selected = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          maxChildSize: (options.length * 0.12).clamp(0.2, 0.6),
          minChildSize: (options.length * 0.12).clamp(0.2, 0.6),
          initialChildSize: (options.length * 0.12).clamp(0.2, 0.6),
          builder: (context, scrollController) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.white, AppColors.dew],
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withValues(alpha: 0.1),
                    offset: const Offset(1, 1),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: AppColors.grey.withValues(alpha: 0.4),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  Container(
                    width: context.width,
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: AppColors.border),
                      ),
                    ),
                    child: Text(
                      "Select $title",
                      style: context.titleLarge.copyWith(
                        fontWeight: FontThickness.semiBold,
                        color: AppColors.green,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: ListView.separated(
                        controller: scrollController,
                        itemCount: options.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 1),
                        itemBuilder: (context, index) {
                          final option = options[index];
                          return RadioListTile<String>(
                            value: option,
                            groupValue: tempSelected,
                            controlAffinity: ListTileControlAffinity.trailing,
                            activeColor: AppColors.frog,
                            title: Text(
                              option,
                              style: context.titleSmall.copyWith(
                                color: AppColors.black.withValues(alpha: 0.6),
                              ),
                            ),
                            onChanged: (value) {
                              tempSelected = value!;
                              Navigator.pop(context, value);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );

    if (selected != null) {
      onSelected(selected);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openBottomSheet(context),
      child: AbsorbPointer(
        child: TextFormField(
          readOnly: true,
          controller: TextEditingController(text: label),
          style: context.titleSmall.copyWith(
            color: AppColors.black.withValues(alpha: 0.6),
          ),
          decoration: InputDecoration(
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: SvgPicture.asset(
                AppIcons.dropdown,
                height: 8,
                width: 8,
                fit: BoxFit.scaleDown,
              ),
            ),
            suffixIconConstraints: const BoxConstraints(
              minHeight: 24,
              minWidth: 24,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: AppColors.grey.withValues(alpha: 0.4),
              ),
            ),
            filled: true,
            fillColor: AppColors.grey.withValues(alpha: 0.05),
          ),
        ),
      ),
    );
  }
}
