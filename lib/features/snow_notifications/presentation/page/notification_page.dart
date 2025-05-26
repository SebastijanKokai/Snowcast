import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:snowcast/core/extensions/context_extensions.dart';
import 'package:snowcast/core/di/injection_container.dart';
import 'package:snowcast/core/utils/permission_utils.dart';
import 'package:snowcast/core/utils/plaform_utils.dart';
import 'package:snowcast/features/mountain_selector/presentation/bloc/mountain_state.dart';
import 'package:snowcast/features/snow_notifications/presentation/bloc/notification_cubit.dart';
import 'package:snowcast/features/snow_notifications/presentation/bloc/notification_state.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _requestNotificationPermission(context);
    });
  }

  Future<void> _requestNotificationPermission(BuildContext context) async {
    if (await isAndroid13OrAbove() && context.mounted) {
      final isGranted = await isNotificationPermissionGranted();
      if (!isGranted && context.mounted) {
        showNotificationPermissionDialog(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NotificationCubit>(),
      child: const _NotificationsView(),
    );
  }
}

class _NotificationsView extends StatelessWidget {
  const _NotificationsView();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.snowNotifications),
        actions: const [
          _CancelButton(),
        ],
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
                l10n.selectMountains,
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

class _CancelButton extends StatelessWidget {
  const _CancelButton();

  Future<void> _showConfirmationDialog(BuildContext context) async {
    final l10n = context.l10n;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.cancelNotifications),
        content: Text(l10n.cancelNotificationsConfirmation),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text(l10n.no),
          ),
          TextButton(
            onPressed: () => context.pop(true),
            style: TextButton.styleFrom(
              foregroundColor: context.colors.error,
            ),
            child: Text(l10n.yes),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      context.read<NotificationCubit>().stopBackgroundChecks();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return IconButton(
      onPressed: () => _showConfirmationDialog(context),
      icon: const Icon(Icons.notifications_off),
      tooltip: l10n.cancelNotificationsTooltip,
      color: context.colors.error,
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
