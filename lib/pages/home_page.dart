import 'package:flutter/material.dart';
import 'package:portfolio/icons%20pages/bloom_boom.dart';
import 'package:portfolio/icons%20pages/chrome_page.dart';
import 'package:provider/provider.dart';
import 'package:portfolio/icons%20pages/about_me_page.dart';
import 'package:portfolio/icons%20pages/contact_page.dart';
import 'package:portfolio/icons%20pages/cv.dart';
import 'package:portfolio/icons%20pages/gallery_page.dart';
import 'package:portfolio/icons%20pages/projects_page.dart';
import 'package:portfolio/icons%20pages/settings_page.dart';
import 'package:portfolio/icons/app_icon.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/utils/recent_apps_manager.dart';
import '../widgets/tablet_frame.dart';
import '../widgets/tablet_screen.dart';
import '../widgets/google_search_widget.dart';
import '../widgets/bottom_buttons_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key}); 

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      body: Center(
        child: TabletFrame(
          child: TabletScreen(
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      const GoogleSearchWidget(),
                      const SizedBox(height: 40),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: GridView.count(
                            crossAxisCount: 4,
                            mainAxisSpacing: 40,
                            crossAxisSpacing: 40,
                            childAspectRatio: 0.85,
                            children: [
                              AppIcon(
                                iconPath: 'assets/icons/projects.png',
                                label: localizations.projects,
                                onTap: () {
                                  Provider.of<RecentAppsManager>(
                                    context,
                                    listen: false,
                                  ).addRecentApp(
                                    RecentApp(
                                      name: localizations.projects,
                                      iconPath: 'assets/icons/projects.png',
                                      page: const ProjectsPage(),
                                    ),
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ProjectsPage(),
                                    ),
                                  );
                                },
                              ),
                              // CV
                              AppIcon(
                                iconPath: 'assets/icons/cv.png',
                                label: 'CV',
                                onTap: () {
                                  Provider.of<RecentAppsManager>(
                                    context,
                                    listen: false,
                                  ).addRecentApp(
                                    RecentApp(
                                      name: 'CV',
                                      iconPath: 'assets/icons/cv.png',
                                      page: const CVPage(),
                                    ),
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const CVPage(),
                                    ),
                                  );
                                },
                              ),
                              // About Me
                              AppIcon(
                                iconPath: 'assets/icons/about_me.png',
                                label: localizations.aboutMe,
                                onTap: () {
                                  Provider.of<RecentAppsManager>(
                                    context,
                                    listen: false,
                                  ).addRecentApp(
                                    RecentApp(
                                      name: localizations.aboutMe,
                                      iconPath: 'assets/icons/about_me.png',
                                      page: const AboutMePage(),
                                    ),
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const AboutMePage(),
                                    ),
                                  );
                                },
                              ),
                              // Gallery
                              AppIcon(
                                iconPath: 'assets/icons/gallery.png',
                                label: localizations.gallery,
                                onTap: () {
                                  Provider.of<RecentAppsManager>(
                                    context,
                                    listen: false,
                                  ).addRecentApp(
                                    RecentApp(
                                      name: localizations.gallery,
                                      iconPath: 'assets/icons/gallery.png',
                                      page: const GalleryPage(),
                                    ),
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const GalleryPage(),
                                    ),
                                  );
                                },
                              ),
                              // Settings
                              AppIcon(
                                iconPath: 'assets/icons/settings.png',
                                label: localizations.settings,
                                onTap: () {
                                  Provider.of<RecentAppsManager>(
                                    context,
                                    listen: false,
                                  ).addRecentApp(
                                    RecentApp(
                                      name: localizations.settings,
                                      iconPath: 'assets/icons/settings.png',
                                      page: const SettingsPage(),
                                    ),
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SettingsPage(),
                                    ),
                                  );
                                },
                              ),
                              // Contact
                              AppIcon(
                                iconPath: 'assets/icons/phone.png',
                                label: localizations.contact,
                                onTap: () {
                                  Provider.of<RecentAppsManager>(
                                    context,
                                    listen: false,
                                  ).addRecentApp(
                                    RecentApp(
                                      name: localizations.contact,
                                      iconPath: 'assets/icons/phone.png',
                                      page: const ContactPage(),
                                    ),
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ContactPage(),
                                    ),
                                  );
                                },
                              ),
                              AppIcon(
                                iconPath: 'assets/icons/bloomboom.png',
                                label: localizations.bloomBoom,
                                onTap: () {
                                  Provider.of<RecentAppsManager>(
                                    context,
                                    listen: false,
                                  ).addRecentApp(
                                    RecentApp(
                                      name: localizations.bloomBoom,
                                      iconPath: 'assets/icons/bloomboom.png',
                                      page: const BloomBoom(),
                                    ),
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const BloomBoom(),
                                    ),
                                  );
                                },
                              ),
                              AppIcon(
                                iconPath: 'assets/icons/chrome.png',
                                label: localizations.chrome,
                                onTap: () {
                                  Provider.of<RecentAppsManager>(
                                    context,
                                    listen: false,
                                  ).addRecentApp(
                                    RecentApp(
                                      name: localizations.chrome,
                                      iconPath: 'assets/icons/chrome.png',
                                      page: const BloomBoom(),
                                    ),
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ChromePage(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const BottomButtonsBar(), // ✅ No parameters!
              ],
            ),
          ),
        ),
      ),
    );
  }
}
