import 'package:intl/intl.dart';

class DateFormatting {
  static String formatDate(DateTime dt) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(dt);
    return formatted;
  }
}
