import 'package:flutter/material.dart';
import 'package:snowcast/core/extensions/context_extensions.dart';

enum AppErrorCode {
  unknown,
  networkError,
  invalidCoordinates,
  invalidAltitude,
  apiError,
  locationError,
}

extension AppErrorCodeX on AppErrorCode {
  String getLocalizedMessage(BuildContext context) {
    final l10n = context.l10n;

    switch (this) {
      case AppErrorCode.unknown:
        return l10n.errorUnknown;
      case AppErrorCode.networkError:
        return l10n.errorNetwork;
      case AppErrorCode.invalidCoordinates:
        return l10n.errorInvalidCoordinates;
      case AppErrorCode.invalidAltitude:
        return l10n.errorInvalidAltitude;
      case AppErrorCode.apiError:
        return l10n.errorApi;
      case AppErrorCode.locationError:
        return l10n.errorLocation;
    }
  }
}
