import 'package:flutter/material.dart';
import 'package:laba_flutter/src/shared/assets/assets.dart';
import 'package:laba_flutter/src/shared/extensions/context_extensions.dart';
import 'package:laba_flutter/src/shared/extensions/widget_modifier.dart';
import 'package:laba_flutter/src/shared/widgets/primary_icon_button.dart';
import 'package:laba_flutter/src/shared/widgets/svg_icon.dart';

class TariffsCard extends StatelessWidget {
  const TariffsCard({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    this.onTap,
  });

  final String image;
  final String name;
  final String? description;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          SvgIcon(
            icon: image,
            color: context.theme.colorScheme.onPrimary,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: context.theme.textTheme.headlineLarge,
              ),
              Text(
                description!,
                style: context.theme.textTheme.labelSmall?.copyWith(
                  color: context.theme.colorScheme.primary.withOpacity(.55),
                ),
              ),
            ],
          ),
          const Spacer(),
          PrimaryIconButton(
            size: 56,
            onClick: () {},
            icon: Assets.iconsArrowRight,
            iconColor: context.theme.colorScheme.primary.withOpacity(.9),
            backgroundColor: Colors.transparent,
          ),
        ],
      ).paddingOnly(left: 16, right: 8),
    );
  }
}
