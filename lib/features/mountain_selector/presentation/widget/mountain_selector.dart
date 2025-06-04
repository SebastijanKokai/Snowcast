import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snowcast/core/di/injection_container.dart';
import 'package:snowcast/core/extensions/context_extensions.dart';
import 'package:snowcast/features/mountain_selector/presentation/bloc/mountain_cubit.dart';
import 'package:snowcast/features/mountain_selector/presentation/bloc/mountain_state.dart';
import 'package:snowcast/features/localization/presentation/widgets/language_selector.dart';

class MountainSelector extends StatelessWidget {
  const MountainSelector({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MountainCubit>(),
      child: SafeArea(
        child: Column(
          children: [
            const _DropdownContainer(),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}

class _DropdownContainer extends StatelessWidget {
  const _DropdownContainer();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Colors.transparent,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Expanded(child: _MountainDropDown()),
            SizedBox(width: 16),
            LanguageSelector(),
          ],
        ),
      ),
    );
  }
}

class _MountainDropDown extends StatelessWidget {
  const _MountainDropDown();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MountainCubit, MountainState>(
      builder: (context, state) {
        return DropdownMenu<String>(
          width: context.width - 32,
          initialSelection: state.selectedMountain?.id,
          onSelected: (id) {
            if (id != null) {
              context.read<MountainCubit>().setMountain(id);
            }
          },
          dropdownMenuEntries: state.mountains
              .map((mountain) => DropdownMenuEntry<String>(
                    value: mountain.id,
                    label: mountain.name,
                    leadingIcon: const Icon(Icons.terrain),
                  ))
              .toList(),
          textStyle: context.text.titleMedium,
          menuStyle: MenuStyle(
            backgroundColor: WidgetStatePropertyAll(
              context.colors.surface,
            ),
            elevation: const WidgetStatePropertyAll(4),
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: context.defaultBorder,
            enabledBorder: context.defaultBorder,
            focusedBorder: context.focusedBorder,
          ),
        );
      },
    );
  }
}
