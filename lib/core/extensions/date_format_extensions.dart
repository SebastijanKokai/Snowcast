import 'package:intl/intl.dart';

extension DateTimeX on String {
  String toFormattedDate() {
    final date = DateTime.parse(this);
    return DateFormat('dd.MM.yyyy.').format(date);
  }

  String toFormattedDateTime() {
    final date = DateTime.parse(this);
    return DateFormat('dd.MM.yyyy. HH:mm').format(date);
  }
}
