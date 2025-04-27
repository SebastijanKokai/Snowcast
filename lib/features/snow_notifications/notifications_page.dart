import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snowcast/core/extensions/context_extensions.dart';
import 'package:snowcast/features/mountain_selector/presentation/bloc/mountain_state.dart';
import 'package:snowcast/features/snow_notifications/presentation/bloc/notification_preferences_cubit.dart';
import 'package:snowcast/features/snow_notifications/presentation/bloc/notification_preferences_state.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationPreferencesCubit(),
      child: const _NotificationsView(),
    );
  }
}

class _NotificationsView extends StatelessWidget {
  const _NotificationsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snow Notifications'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Select mountains to receive snow notifications',
              style: context.text.titleMedium,
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: Mountain.values.length,
              itemBuilder: (context, index) {
                final mountain = Mountain.values[index];
                return _MountainSelectionTile(mountain: mountain);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _MountainSelectionTile extends StatelessWidget {
  const _MountainSelectionTile({required this.mountain});

  final Mountain mountain;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationPreferencesCubit, NotificationPreferencesState>(
      builder: (context, state) {
        final isSelected = state.selectedMountains[mountain] ?? false;

        return ListTile(
          leading: Icon(
            Icons.terrain,
            color: isSelected ? context.colors.primary : context.colors.onSurfaceVariant,
          ),
          title: Text(mountain.name),
          subtitle: Text(
            '${mountain.topAltitude}m - ${mountain.bottomAltitude}m',
            style: context.text.bodySmall,
          ),
          trailing: Switch(
            value: isSelected,
            onChanged: (_) => context.read<NotificationPreferencesCubit>().toggleMountain(mountain),
          ),
          onTap: () => context.read<NotificationPreferencesCubit>().toggleMountain(mountain),
        );
      },
    );
  }
}
