import 'package:flutter/material.dart';
import 'package:laba_flutter/src/app/styles/dimensions.dart';
import 'package:laba_flutter/src/pages/user_profile/models/interest_model.dart';
import 'package:laba_flutter/src/shared/extensions/context_extensions.dart';

class ThemeChip extends StatelessWidget {
  const ThemeChip({
    super.key,
    required this.interestModel,
    required this.isSelected,
    this.onSelected,
  });

  final InterestModel interestModel;
  final bool isSelected;
  final ValueChanged<bool>? onSelected;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      selected: isSelected,
      label: Text(
        interestModel.label,
        style: context.theme.textTheme.labelSmall,
      ),
      selectedColor: context.theme.colorScheme.primary.withOpacity(.08),
      onSelected: onSelected,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Colors.transparent,
          width: 0,
          style: BorderStyle.none,
        ),
        borderRadius: BorderRadius.circular(AppDimensions.circle),
      ),
      backgroundColor: context.theme.colorScheme.primary.withOpacity(.08),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      elevation: 0,
      pressElevation: 0,
      checkmarkColor: context.theme.colorScheme.onPrimary,
    );
  }
}
