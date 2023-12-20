import 'package:flutter/material.dart';
import 'package:laba_flutter/src/pages/user_profile/models/tariff_model.dart';
import 'package:laba_flutter/src/shared/assets/assets.dart';
import 'package:laba_flutter/src/shared/extensions/context_extensions.dart';
import 'package:laba_flutter/src/shared/widgets/primary_icon_button.dart';
import 'package:laba_flutter/src/shared/widgets/svg_icon.dart';

class TariffsCard extends StatelessWidget {
  const TariffsCard({
    super.key,
    required this.tariffModel,
  });

  final TariffModel tariffModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgIcon(
        icon: tariffModel.image,
        color: context.theme.colorScheme.onPrimary,
      ),
      title: Text(
        tariffModel.name,
        style: context.theme.textTheme.headlineLarge,
      ),
      subtitle: tariffModel.description != null
          ? Text(
              tariffModel.description!,
              style: context.theme.textTheme.labelSmall?.copyWith(
                color: context.theme.colorScheme.primary.withOpacity(.55),
              ),
              textAlign: TextAlign.start,
            )
          : null,
      trailing: PrimaryIconButton(
        size: 56,
        onClick: () {},
        icon: Assets.iconsArrowRight,
        iconColor: context.theme.colorScheme.primary.withOpacity(.9),
        backgroundColor: Colors.transparent,
      ),
      onTap: tariffModel.onTap,
    );
  }
}
