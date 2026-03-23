import 'package:intl/intl.dart';

extension DateFormatX on DateFormat {
  String? tryFormat(DateTime? date) {
    if (date == null) return null;
    return format(date);
  }
}

extension DateTimeX on DateTime {
  String toMonthName() {
    final month = DateFormat.MMMM(Intl.getCurrentLocale()).format(this);
    return '${month[0].toUpperCase()}${month.substring(1)}';
  }

  String toHHmmddMMyyyyDoted() => DateFormat('HH:mm dd.MM.yyyy').format(this);

  String toddMMyyyyDoted() => DateFormat('dd.MM.yyyy').format(this);

  String toddMMyyyyHHmmDoted() => DateFormat('dd.MM.yyyy HH:mm').format(this);

  String toddMMyyyyString({
    required String separator,
  }) {
    return DateFormat('dd${separator}MM${separator}yyyy').format(this);
  }

  String get formatDateTimeYear {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  String get formatDateYear {
    return DateFormat('yyyy').format(this);
  }

  String toyyyyMMDDDashed() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  String toHourString({
    required String separator,
  }) {
    return DateFormat('HH${separator}mm').format(this);
  }
}

String formatDate(String date) {
  if (date != '' && date != ' ') {
    final dateTime = DateTime.parse(date);
    return DateFormat('dd-MM-yyyy').format(dateTime);
  } else {
    return '';
  }
}
