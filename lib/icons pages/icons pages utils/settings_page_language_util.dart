import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:portfolio/utils/app_settings_manager.dart';
import 'package:portfolio/widgets/bottom_buttons_bar.dart';
import 'package:portfolio/widgets/tablet_frame.dart';
import 'package:portfolio/widgets/tablet_screen.dart';
import 'package:portfolio/l10n/app_localizations.dart';

class SettingsPageLanguageUtil extends StatelessWidget {
  const SettingsPageLanguageUtil({super.key}); // ✅ No parameters!

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      body: Center(
        child: TabletFrame(
          child: TabletScreen(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade50,
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 4, offset: const Offset(0, 2))],
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black87),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Text(
                        localizations.selectAppLanguage,
                        style: const TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.deepPurple.shade50, Colors.deepPurple.shade800],
                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // ✅ Use Provider!
                              Provider.of<AppSettingsManager>(context, listen: false).changeLocale(const Locale('en'));
                            },
                            child: const Text("English"),
                          ),
                          const SizedBox(width: 24),
                          ElevatedButton(
                            onPressed: () {
                              // ✅ Use Provider!
                              Provider.of<AppSettingsManager>(context, listen: false).changeLocale(const Locale('es'));
                            },
                            child: const Text("Español"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const BottomButtonsBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
