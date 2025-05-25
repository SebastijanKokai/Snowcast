import 'package:flutter/material.dart';
import 'package:snowcast/features/localization/presentation/widgets/language_selector.dart';
import 'package:snowcast/core/extensions/context_extensions.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text(context.l10n.language),
          trailing: const LanguageSelector(),
        ),
      ],
    );
  }
}
