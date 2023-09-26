import 'package:intl/intl.dart';

class DateHelper {
  static String getToday() {
    return DateFormat('dd-MM-yyyy').format(DateTime.now());
  }

  static String getTomorrow() {
    return DateFormat('dd-MM-yyyy')
        .format(DateTime.now().add(Duration(days: 1)));
  }

  static String getYesterday() {
    return DateFormat('dd-MM-yyyy')
        .format(DateTime.now().add(Duration(days: -1)));
  }
}
