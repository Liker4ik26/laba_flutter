import 'package:flutter/material.dart';
import 'package:laba_flutter/src/pages/user_profile/widgets/user_photo.dart';
import 'package:laba_flutter/src/shared/assets/assets.dart';
import 'package:laba_flutter/src/shared/extensions/context_extensions.dart';
import 'package:laba_flutter/src/shared/extensions/widget_modifier.dart';
import 'package:laba_flutter/src/shared/widgets/primary_icon_button.dart';

class UserProfileAppBar extends StatelessWidget {
  const UserProfileAppBar({
    super.key,
    required this.tabs,
    required this.username,
    required this.userPhoto,
  });

  final List<Widget> tabs;
  final String username;
  final String userPhoto;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.large(
      pinned: true,
      floating: true,
      snap: true,
      titleSpacing: 0,
      centerTitle: true,
      expandedHeight: 280,
      leadingWidth: 68,
      leading: PrimaryIconButton(
        backgroundColor: context.theme.colorScheme.secondary,
        icon: Assets.iconsClose,
        iconColor: context.theme.colorScheme.onPrimary,
      ),
      actions: [
        PrimaryIconButton(
          backgroundColor: context.theme.colorScheme.secondary,
          icon: Assets.iconsLogOut,
          iconColor: context.theme.colorScheme.onPrimary,
        ).paddingOnly(right: 14),
      ],
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1,
        centerTitle: true,
        background: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 24),
              UserPhoto(
                image: userPhoto,
              ),
              const SizedBox(height: 36),
              Text(
                username,
                style: context.theme.textTheme.labelLarge,
              ),
            ],
          ),
        ),
      ),
      bottom: TabBar(
        tabs: tabs,
        indicatorColor: context.theme.colorScheme.onSecondary,
        indicatorSize: TabBarIndicatorSize.tab,
      ),
    );
  }
}
