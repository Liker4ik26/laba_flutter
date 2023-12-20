import 'package:flutter/material.dart';
import 'package:laba_flutter/src/shared/extensions/context_extensions.dart';
import 'package:laba_flutter/src/shared/extensions/widget_modifier.dart';

class SectionHeaderWidget extends StatelessWidget {
  const SectionHeaderWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.theme.textTheme.labelMedium,
        ).paddingSymmetric(horizontal: 16),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: context.theme.textTheme.labelSmall?.copyWith(
            color: context.theme.colorScheme.primary.withOpacity(.55),
          ),
        ).paddingSymmetric(horizontal: 16),
      ],
    );
  }
}
