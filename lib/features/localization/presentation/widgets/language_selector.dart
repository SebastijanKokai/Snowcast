import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/locale_cubit.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, state) {
        return DropdownButton<Locale>(
          value: state.locale,
          items: const [
            DropdownMenuItem(
              value: Locale('en'),
              child: Text('English'),
            ),
            DropdownMenuItem(
              value: Locale('sr'),
              child: Text('Serbian'),
            ),
          ],
          onChanged: (Locale? newLocale) {
            if (newLocale != null) {
              context.read<LocaleCubit>().setLocale(newLocale);
            }
          },
        );
      },
    );
  }
}
