import 'package:flutter/material.dart';
import 'package:laba_flutter/src/shared/extensions/context_extensions.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(context.tr.tabNameSettings);
  }
}
