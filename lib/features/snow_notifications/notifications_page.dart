import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snowcast/core/extensions/context_extensions.dart';
import 'package:snowcast/core/services/shared_preferences_service.dart';
import 'package:snowcast/features/mountain_selector/presentation/bloc/mountain_state.dart';
import 'package:snowcast/features/snow_notifications/domain/usecase/notification_usecase.dart';
import 'package:snowcast/features/snow_notifications/presentation/bloc/notification_cubit.dart';
import 'package:snowcast/features/snow_notifications/presentation/bloc/notification_state.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferencesService>(
      future: SharedPreferencesService.instance,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        return BlocProvider(
          create: (context) => NotificationCubit(
            NotificationUsecase(),
          ),
          child: const _NotificationsView(),
        );
      },
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
      body: BlocListener<NotificationCubit, NotificationState>(
        listener: (context, state) {
          if (state.error.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: context.colors.error,
              ),
            );
          }
        },
        child: Column(
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
      ),
    );
  }
}

class _MountainSelectionTile extends StatelessWidget {
  const _MountainSelectionTile({required this.mountain});

  final Mountain mountain;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
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
            onChanged: (_) => context.read<NotificationCubit>().toggleMountain(mountain),
          ),
          onTap: () => context.read<NotificationCubit>().toggleMountain(mountain),
        );
      },
    );
  }
}
