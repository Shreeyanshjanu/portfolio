import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:portfolio/pages/home_page.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/utils/app_settings_manager.dart';
import 'package:portfolio/utils/recent_apps_manager.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppSettingsManager()),
        ChangeNotifierProvider(create: (_) => RecentAppsManager()),
      ],
      child: const PortfolioAppWrapper(),
    ),
  );
}

class PortfolioAppWrapper extends StatelessWidget {
  const PortfolioAppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // Listen to settings changes
    final settings = Provider.of<AppSettingsManager>(context);

    return MaterialApp(
      title: 'Android Tablet Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: settings.currentLocale, 
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(settings.textScaleFactor),
          ),
          child: Stack(
            children: [
              child!,
              IgnorePointer(
                child: Container(
                  color: Colors.black.withOpacity(1 - settings.brightness), 
                ),
              ),
            ],
          ),
        );
      },
      home: const HomePage(),
    );
  }
}
