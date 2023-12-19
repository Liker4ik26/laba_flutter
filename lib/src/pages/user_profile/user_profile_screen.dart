import 'package:flutter/material.dart';
import 'package:laba_flutter/src/pages/user_profile/widgets/profile_page.dart';
import 'package:laba_flutter/src/pages/user_profile/widgets/settings_page.dart';
import 'package:laba_flutter/src/pages/user_profile/widgets/user_profile_app_bar.dart';
import 'package:laba_flutter/src/shared/assets/assets.dart';
import 'package:laba_flutter/src/shared/extensions/context_extensions.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = [
      context.tr.tabNameProfile,
      context.tr.tabNameSettings,
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Material(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: UserProfileAppBar(
                  tabs: tabs.map((e) {
                    return Tab(text: e);
                  }).toList(),
                  username: context.tr.userName,
                  userPhoto: Assets.imagesUserPhoto,
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              ProfilePage(),
              SettingsPage(),
            ],
          ),
        ),
      ),
    );
  }
}
