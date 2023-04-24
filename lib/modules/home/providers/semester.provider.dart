// ignore_for_file: constant_identifier_names

import 'package:hooks_riverpod/hooks_riverpod.dart';

enum Semester {
  Winter,
  Spring,
  Summer,
  Fall,
}

Semester getSemester(int month) {
  switch (month) {
    case 1:
      return Semester.Winter;
    case 2:
    case 3:
    case 4:
    case 5:
      return Semester.Spring;
    case 6:
    case 7:
    case 8:
      return Semester.Summer;
    case 9:
    case 10:
    case 11:
    case 12:
      return Semester.Fall;
    default:
      throw Exception('Invalid month number');
  }
}

final currentSemesterProvider = StateProvider<String>((ref) {
  return getSemester(DateTime.now().month).name;
});
