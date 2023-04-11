import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt_revamped/shared/models/user.model.dart';

final classNameProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});

final classCodeProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});

final selectedSemesterProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});

final classLocationProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});

final selectedDaysProvider = StateProvider.autoDispose<List<String>>((ref) {
  return [];
});

final selectedTimeProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});

final selectedStudentsProvider =
    StateProvider.autoDispose<List<UserModel>>((ref) {
  return [];
});
