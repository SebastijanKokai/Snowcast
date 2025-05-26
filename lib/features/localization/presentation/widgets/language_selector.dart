import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flag/flag.dart';
import 'package:snowcast/core/extensions/context_extensions.dart';
import '../bloc/locale_cubit.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, state) {
        return PopupMenuButton<Locale>(
          icon: const Icon(Icons.language, size: 24),
          tooltip: l10n.language,
          itemBuilder: (context) => [
            PopupMenuItem(
              value: const Locale('en'),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Flag.fromString(
                    'GB',
                    height: 16,
                    width: 24,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(width: 8),
                  Text(l10n.english),
                ],
              ),
            ),
            PopupMenuItem(
              value: const Locale('sr'),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Flag.fromString(
                    'RS',
                    height: 16,
                    width: 24,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(width: 8),
                  Text(l10n.serbian),
                ],
              ),
            ),
          ],
          onSelected: (Locale newLocale) {
            context.read<LocaleCubit>().setLocale(newLocale);
          },
        );
      },
    );
  }
}
