// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/foundation.dart';
// import 'package:hive/hive.dart';
// import 'package:idnyt/constants/hive_box.dart';
// import 'package:idnyt/routing/router.dart';
// import 'package:idnyt/modules/shared/services/auth.service.dart';

// class AuthGuard extends AutoRouteGuard {
//   final AuthService _authService;
//   AuthGuard(this._authService);
//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router) async {
//     try {
//       var status = await _authService.currentAuth();
//       if (status) {
//         resolver.next(true);
//         router.replaceAll([HomeRoute()]);
//       } else {
//         router.replaceAll([LoginRoute()]);
//       }
//     } catch (e) {
//       debugPrint("Error [onNavigation] ${e.toString()}");
//       router.replaceAll([LoginRoute()]);
//       return;
//     }
//   }
// }
