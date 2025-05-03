import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snowcast/core/di/injection_container.dart';
import 'package:snowcast/core/extensions/context_extensions.dart';
import 'package:snowcast/features/mountain_selector/presentation/bloc/mountain_cubit.dart';
import 'package:snowcast/features/mountain_selector/presentation/bloc/mountain_state.dart';

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
      decoration: BoxDecoration(
        color: context.colors.surface,
        boxShadow: [
          BoxShadow(
            color: context.colors.shadow.withAlpha(26),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: _MountainDropDown(),
      ),
    );
  }
}

class _MountainDropDown extends StatelessWidget {
  const _MountainDropDown();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MountainCubit, MountainState, Mountain>(
      selector: (state) => state.selectedMountain,
      builder: (context, state) {
        return DropdownMenu<Mountain>(
          width: context.width - 32,
          initialSelection: state,
          onSelected: (mountain) {
            if (mountain != null) {
              context.read<MountainCubit>().setMountain(mountain.name);
            }
          },
          dropdownMenuEntries: Mountain.values
              .map((mountain) => DropdownMenuEntry<Mountain>(
                    value: mountain,
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
