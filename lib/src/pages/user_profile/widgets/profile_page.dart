import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:laba_flutter/src/pages/user_profile/models/interest_model.dart';
import 'package:laba_flutter/src/pages/user_profile/models/service_model.dart';
import 'package:laba_flutter/src/pages/user_profile/widgets/service_card.dart';
import 'package:laba_flutter/src/pages/user_profile/widgets/tariffs_card.dart';
import 'package:laba_flutter/src/pages/user_profile/widgets/theme_chip.dart';
import 'package:laba_flutter/src/shared/assets/assets.dart';
import 'package:laba_flutter/src/shared/extensions/context_extensions.dart';
import 'package:laba_flutter/src/shared/extensions/widget_modifier.dart';

class ProfilePage extends HookWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      const ServiceModel(
        image: Assets.iconsMc36Sberprime,
        name: 'СберПрайм',
        description: 'Платёж 9 июля',
        price: '199 ₽ в месяц',
      ),
      const ServiceModel(
        image: Assets.iconsIc36PercentFill,
        name: 'Переводы',
        description: 'Автопродление 21 августа',
        price: '199 ₽ в месяц',
      ),
    ];
    final interestsList = [
      const InterestModel(label: 'Еда'),
      const InterestModel(label: 'Саморазвитие'),
      const InterestModel(label: 'Технологии'),
      const InterestModel(label: 'Дом'),
      const InterestModel(label: 'Досуг'),
      const InterestModel(label: 'Забота о себе'),
      const InterestModel(label: 'Наука'),
    ];

    final selectedInterest = useState<List<InterestModel>>([]);

    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      body: Builder(
        builder: (context) {
          return CustomScrollView(
            slivers: [
              SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Text(
                    context.tr.youHaveConnected,
                    style: context.theme.textTheme.labelMedium,
                  ).paddingSymmetric(horizontal: 16),
                  const SizedBox(height: 8),
                  Text(
                    context.tr.subscriptions,
                    style: context.theme.textTheme.labelSmall?.copyWith(
                      color: context.theme.colorScheme.primary.withOpacity(.55),
                    ),
                  ).paddingSymmetric(horizontal: 16),
                  SizedBox(
                    height: 160,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ServiceCard(serviceModel: services[index]);
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 8,
                      ),
                      itemCount: services.length,
                    ),
                  ),
                  const SizedBox(height: 46),
                  Text(
                    context.tr.youHaveConnected,
                    style: context.theme.textTheme.labelMedium,
                  ).paddingSymmetric(horizontal: 16),
                  const SizedBox(height: 8),
                  Text(
                    context.tr.subscriptions,
                    style: context.theme.textTheme.labelSmall?.copyWith(
                      color: context.theme.colorScheme.primary.withOpacity(.55),
                    ),
                  ).paddingSymmetric(horizontal: 16),
                  TariffsCard(
                    image: Assets.iconsPressure,
                    name: context.tr.dailyLimit,
                    description: context.tr.forPaymentsAndTransfers,
                    onTap: () {},
                  ),
                  Divider(
                    color: context.theme.colorScheme.primary.withOpacity(.12),
                    thickness: 2,
                    indent: 60,
                    endIndent: 0,
                  ),
                  TariffsCard(
                    image: Assets.iconsPercent,
                    name: context.tr.transfersWithoutCommission,
                    description: context.tr.showBalance,
                    onTap: () {},
                  ),
                  Divider(
                    color: context.theme.colorScheme.primary.withOpacity(.12),
                    thickness: 2,
                    indent: 60,
                    endIndent: 0,
                  ),
                  TariffsCard(
                    description: '',
                    image: Assets.iconsIarrowsForwardBack,
                    name: context.tr.informationTariffsAndLimits,
                    onTap: () {},
                  ),
                  const SizedBox(height: 46),
                  Text(
                    context.tr.interests,
                    style: context.theme.textTheme.labelMedium,
                  ).paddingSymmetric(horizontal: 16),
                  const SizedBox(height: 8),
                  Text(
                    context.tr.storiesAndSuggestions,
                    style: context.theme.textTheme.labelSmall?.copyWith(
                      color: context.theme.colorScheme.primary.withOpacity(.55),
                    ),
                  ).paddingSymmetric(horizontal: 16),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    children: interestsList.map((interest) {
                      return ThemeChip(
                        interestModel: interest,
                        isSelected: selectedInterest.value.contains(interest),
                        onSelected: (value) {
                          if (value) {
                            selectedInterest.value = [
                              ...selectedInterest.value..add(interest),
                            ];
                          } else {
                            selectedInterest.value = [
                              ...selectedInterest.value..remove(interest),
                            ];
                          }
                        },
                      );
                    }).toList(),
                  ).paddingSymmetric(horizontal: 16),
                  const SizedBox(height: 32),
                ],
              ).sliver,
            ],
          );
        },
      ),
    );
  }
}
