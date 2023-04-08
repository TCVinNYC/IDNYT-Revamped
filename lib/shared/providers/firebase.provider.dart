import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt_revamped/shared/models/user.dart';
import 'package:idnyt_revamped/shared/providers/auth.provider.dart';
import 'package:idnyt_revamped/shared/services/firebase.service.dart';

final firestoreProvider = Provider<FirebaseService>((ref) {
  // final User? authUser = ref.read(authStateProvider).value;
  final User? authUser = ref.watch(authServiceProvider).currentUser;
  return FirebaseService(authUser: authUser);
});

// final userDataProvider = FutureProvider<UserModel?>((ref) {
//   return ref.read(firestoreProvider).userData;
// });

final userDataStreamProvider = StreamProvider<UserModel?>((ref) {
  return ref.read(firestoreProvider).userDataStream;
});
