import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt_revamped/shared/providers/firebase.provider.dart';

class TabNavigationObserver extends AutoRouterObserver {
  /// Riverpod Instance
  final WidgetRef ref;

  TabNavigationObserver({
    required this.ref,
  });

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    // Perform tasks on first navigation to SearchRoute
    if (route.path == 'StudentHomePage') {
      // ref.refresh(getCuratedLocationProvider);
    }
  }

  @override
  Future<void> didChangeTabRoute(
    TabPageRoute route,
    TabPageRoute previousRoute,
  ) async {
    // Perform tasks on re-visit to SearchRoute
    if (route.path == 'blue') {
      // Refresh Location State
      // ref.invalidate(getCuratedLocationProvider);
      // ref.invalidate(getCuratedObjectProvider);
    }

    if (route.path == 'red') {
      // ref.read(sharedAlbumProvider.notifier).getAllSharedAlbums();
    }

    if (route.path == 'green') {
      // ref.read(albumProvider.notifier).getAllAlbums();
    }
    ref.watch(userDataStreamProvider);
    ref.read(firestoreProvider);
    // ref.watch(serverInfoProvider.notifier).getServerVersion();
  }
}
