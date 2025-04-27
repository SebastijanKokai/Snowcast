import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snowcast/features/mountain_selector/presentation/bloc/mountain_cubit.dart';
import 'package:snowcast/features/mountain_selector/presentation/bloc/mountain_state.dart';

class MountainSelector extends StatelessWidget {
  const MountainSelector({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MountainCubit(),
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
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Align(
        alignment: Alignment.topCenter,
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
      selector: (state) {
        return state.selectedMountain;
      },
      builder: (context, state) {
        return DropdownButton<String>(
          value: state.name,
          items: Mountain.values
              .map((Mountain value) => DropdownMenuItem<String>(
                    value: value.name,
                    child: Text(value.name),
                  ))
              .toList(),
          onChanged: (mountain) {
            context.read<MountainCubit>().setMountain(mountain ?? '');
          },
        );
      },
    );
  }
}
