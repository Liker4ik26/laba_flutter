import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:laba_flutter/src/pages/user_profile/models/interest_model.dart';
import 'package:laba_flutter/src/pages/user_profile/models/service_model.dart';
import 'package:laba_flutter/src/pages/user_profile/models/tariff_model.dart';
import 'package:laba_flutter/src/pages/user_profile/widgets/section_header_widget.dart';
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

    final tariffs = [
      TariffModel(
        () {},
        image: Assets.iconsPressure,
        name: context.tr.dailyLimit,
        description: context.tr.forPaymentsAndTransfers,
      ),
      TariffModel(
        () {},
        image: Assets.iconsPercent,
        name: context.tr.transfersWithoutCommission,
        description: context.tr.showBalance,
      ),
      TariffModel(
        () {},
        description: null,
        image: Assets.iconsIarrowsForwardBack,
        name: context.tr.informationTariffsAndLimits,
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
                  SectionHeaderWidget(
                    title: context.tr.youHaveConnected,
                    subtitle: context.tr.subscriptions,
                  ),
                  const SizedBox(height: 20),
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
                  SectionHeaderWidget(
                    title: context.tr.tariffsAndLimits,
                    subtitle: context.tr.forTransactions,
                  ),
                  const SizedBox(height: 20),
                  CustomScrollView(
                    shrinkWrap: true,
                    slivers: [
                      SliverList.separated(
                        itemBuilder: (context, index) {
                          return TariffsCard(
                            tariffModel: tariffs[index],
                          );
                        },
                        separatorBuilder: (context, index) => Divider(
                          color: context.theme.colorScheme.primary
                              .withOpacity(.12),
                          thickness: 2,
                          indent: 60,
                          endIndent: 0,
                        ),
                        itemCount: tariffs.length,
                      ),
                    ],
                  ),
                  const SizedBox(height: 46),
                  SectionHeaderWidget(
                    title: context.tr.interests,
                    subtitle: context.tr.storiesAndSuggestions,
                  ),
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
