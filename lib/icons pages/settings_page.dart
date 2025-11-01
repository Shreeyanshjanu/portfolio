import 'package:flutter/material.dart';
import 'package:portfolio/icons%20pages/icons%20pages%20utils/settings_page_app_info_util.dart';
import 'package:portfolio/icons%20pages/icons%20pages%20utils/settings_page_language_util.dart';
import 'package:portfolio/icons%20pages/icons%20pages%20utils/settings_page_font_size_util.dart';
import 'package:portfolio/icons%20pages/icons%20pages%20utils/settings_page_light_dark_mode_util.dart';
import 'package:portfolio/widgets/bottom_buttons_bar.dart';
import 'package:portfolio/widgets/tablet_frame.dart';
import 'package:portfolio/widgets/tablet_screen.dart';
import 'package:portfolio/l10n/app_localizations.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key}); 

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    final settings = [
      {
        'iconPath': 'assets/icons/settings_icons/easter_egg.png',
        'title': localizations.easterEgg,
      },
      {
        'iconPath': 'assets/icons/settings_icons/language.png',
        'title': localizations.language,
      },
      {
        'iconPath': 'assets/icons/settings_icons/smartphone.png',
        'title': localizations.aboutSystem,
      },
      {
        'iconPath': 'assets/icons/settings_icons/switch.png',
        'title': localizations.darkLightMode,
      },
      {
        'iconPath': 'assets/icons/settings_icons/font.png',
        'title': localizations.fontSize,
      },
    ];

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
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.black87,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        localizations.settings,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
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
                        colors: [
                          Colors.deepPurple.shade50,
                          Colors.deepPurple.shade800,
                        ],
                      ),
                    ),
                    child: ListView.separated(
                      itemCount: settings.length,
                      separatorBuilder: (context, index) => const Divider(height: 1),
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Image.asset(
                            settings[index]['iconPath'] as String,
                            width: 32,
                            height: 32,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.settings,
                                color: Colors.deepPurpleAccent,
                              );
                            },
                          ),
                          title: Text(
                            settings[index]['title'] as String,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onTap: () {
                            if (settings[index]['title'] == localizations.aboutSystem) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SettingsPageAppInfoUtil(),
                                ),
                              );
                            } else if (settings[index]['title'] == localizations.language) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SettingsPageLanguageUtil(), 
                                ),
                              );
                            } else if (settings[index]['title'] == localizations.fontSize) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SettingsPageFontSizeUtil(), 
                                ),
                              );
                            } else if (settings[index]['title'] == localizations.darkLightMode) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SettingsPageLightDarkModeUtil(), 
                                ),
                              );
                            }
                          },
                        );
                      },
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
