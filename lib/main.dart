import 'dart:async';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:idnyt_revamped/constants/locales.dart';
import 'package:idnyt_revamped/routing/app_router.dart';
import 'package:idnyt_revamped/utils/idnyt_app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    name: 'idnyt-revamped-v2',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  debugPrint("Firebase initialized");

  await Hive.initFlutter();
  debugPrint("Hive initialized");

  await EasyLocalization.ensureInitialized();

  if (kReleaseMode && Platform.isAndroid) {
    try {
      await FlutterDisplayMode.setHighRefreshRate();
    } catch (e) {
      debugPrint("Error setting high refresh rate: $e");
    }
  }
  runApp(
    EasyLocalization(
      supportedLocales: locales,
      path: translationsPath,
      useFallbackTranslations: true,
      fallbackLocale: locales.first,
      child: const ProviderScope(child: IDNYTApp()),
    ),
  );
}

class IDNYTApp extends ConsumerStatefulWidget {
  const IDNYTApp({super.key});

  @override
  IDNYTAppState createState() => IDNYTAppState();
}

class IDNYTAppState extends ConsumerState<IDNYTApp>
    with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        debugPrint("[APP STATE] resumed");
        break;

      case AppLifecycleState.inactive:
        debugPrint("[APP STATE] inactive");
        break;

      case AppLifecycleState.paused:
        debugPrint("[APP STATE] paused");
        break;

      case AppLifecycleState.detached:
        debugPrint("[APP STATE] detached");
        break;
    }
  }

  Future<void> initApp() async {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  initState() {
    super.initState();
    initApp().then((_) => debugPrint("App Init Completed"));
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: [
          MaterialApp.router(
            title: 'IDNYT',
            debugShowCheckedModeBanner: false,
            //themeMode: ref.watch(appThemeProvider),
            themeMode: ThemeMode.system,
            darkTheme: idnytDarkTheme,
            theme: idnytLightTheme,
            routerConfig: _appRouter.config(),
          ),
          // const IDNYTLoadingOverlay(),
          // const VersionAnnouncementOverlay(),
        ],
      ),
    );
  }
}
