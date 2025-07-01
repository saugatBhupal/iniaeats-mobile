import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inaeats/src/core/constants/app_assets.dart';
import 'package:inaeats/src/core/constants/app_colors.dart';
import 'package:inaeats/src/core/constants/app_strings.dart';
import 'package:inaeats/src/core/constants/media_query_values.dart';

class SearchTextField extends StatefulWidget {
  final Function()? onTap;
  final ValueChanged<String>? onSubmitted;
  const SearchTextField({super.key, this.onTap, this.onSubmitted});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final FocusNode _focusNode = FocusNode();
  late final TextEditingController _searchController;
  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: SearchBar(
        textInputAction: TextInputAction.search,
        controller: _searchController,
        hintText: AppStrings.searchPH,
        onTap: widget.onTap,
        onSubmitted: widget.onSubmitted,
        onTapOutside: (event) {
          _focusNode.unfocus();
        },
        focusNode: _focusNode,
        backgroundColor: WidgetStatePropertyAll(AppColors.white),
        elevation: WidgetStatePropertyAll(0),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: const BorderSide(color: AppColors.border),
          ),
        ),
        hintStyle: WidgetStatePropertyAll(
          context.bodySmall.copyWith(color: AppColors.grey.withValues(alpha: 0.5)),
        ),
        textStyle: WidgetStatePropertyAll(
          context.titleSmall.copyWith(color: AppColors.black.withValues(alpha: 0.6)),
        ),
        leading: SvgPicture.asset(AppIcons.search, width: 20, height: 20),
      ),
    );
  }
}
