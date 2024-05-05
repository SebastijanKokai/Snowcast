import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snowcast/mountain_selector/bloc/mountain_selector_cubit.dart';
import 'package:snowcast/mountain_selector/bloc/mountain_selector_state.dart';
import 'package:snowcast/mountain_selector/extension/mountain_extension.dart';
import 'package:snowcast/weather/presentation/bloc/weather_cubit.dart';

class MountainSelector extends StatelessWidget {
  const MountainSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MountainSelectorCubit, MountainSelectorState>(
      listener: (context, state) {
        final (lat, lon, alt) = state.selectedMountain.getCoordinates();
        context.read<WeatherCubit>().getWeather(lat: lat, lon: lon, alt: alt);
      },
      buildWhen: (previous, current) {
        return previous.availableMountains != current.availableMountains;
      },
      builder: (context, state) {
        return DropdownMenu(
            onSelected: (value) async {
              if (value == null) {
                return;
              }
              context.read<MountainSelectorCubit>().setMountain(value);
            },
            initialSelection: state.selectedMountain,
            trailingIcon: const Icon(
              Icons.arrow_downward,
              size: 24,
            ),
            dropdownMenuEntries: state.availableMountains.map((mountain) {
              return DropdownMenuEntry(value: mountain, label: mountain.name);
            }).toList());
      },
    );
  }
}
