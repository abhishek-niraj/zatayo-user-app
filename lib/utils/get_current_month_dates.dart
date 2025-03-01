import 'package:intl/intl.dart';

Map<String, String> getCurrentMonthDates() {
  DateTime now = DateTime.now();

  DateTime startDate = DateTime(now.year, now.month, 1);

  DateTime endDate = DateTime(now.year, now.month + 1, 0);

  String formattedStartDate = DateFormat('yyyy-MM-dd').format(startDate);
  String formattedEndDate = DateFormat('yyyy-MM-dd').format(endDate);

  return {
    "startDate": formattedStartDate,
    "endDate": formattedEndDate,
  };
}