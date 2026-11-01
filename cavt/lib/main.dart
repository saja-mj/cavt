import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/theme/app_theme.dart';
import 'data/services/app_state.dart';
import 'features/splash/presentation/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appState = AppState();
  await appState.initialize();
  runApp(HakamaApp(appState: appState));
}

class HakamaApp extends StatelessWidget {
  const HakamaApp({super.key, required this.appState});

  final AppState appState;

  @override
  Widget build(BuildContext context) {
    return AppStateScope(
      notifier: appState,
      child: AnimatedBuilder(
        animation: appState,
        builder: (context, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'كلية التدريب المهني المتقدم - حكما',
          locale: const Locale('ar'),
          supportedLocales: const [Locale('ar')],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: appState.themeMode,
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
