import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laba_flutter/src/app/styles/dimensions.dart';
import 'package:laba_flutter/src/pages/user_profile/models/service_model.dart';
import 'package:laba_flutter/src/shared/extensions/context_extensions.dart';
import 'package:laba_flutter/src/shared/extensions/widget_modifier.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    super.key,
    required this.serviceModel,
  });

  final ServiceModel serviceModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 216,
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(AppDimensions.extraSmall),
        boxShadow: const [
          BoxShadow(
            color: Color(0x114F4F6C),
            blurRadius: AppDimensions.small,
            offset: Offset(0, 8),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: context.theme.colorScheme.background,
                child: SvgPicture.asset(
                  serviceModel.image,
                  width: 36,
                  height: 36,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                serviceModel.name,
                style: context.theme.textTheme.headlineLarge,
              ),
            ],
          ).paddingOnly(left: 16, top: 14, bottom: 22),
          Text(
            serviceModel.description,
            style: context.theme.textTheme.labelSmall,
          ).paddingSymmetric(horizontal: 16),
          Text(
            serviceModel.price,
            style: context.theme.textTheme.labelSmall?.copyWith(
              color: context.theme.colorScheme.primary.withOpacity(.55),
            ),
          ).paddingOnly(left: 16, bottom: 16),
        ],
      ),
    );
  }
}
