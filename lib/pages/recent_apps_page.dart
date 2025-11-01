import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:portfolio/utils/recent_apps_manager.dart';
import 'package:portfolio/widgets/tablet_frame.dart';
import 'package:portfolio/widgets/tablet_screen.dart';
import 'package:portfolio/widgets/bottom_buttons_bar.dart';

class RecentAppsPage extends StatelessWidget {
  const RecentAppsPage({super.key}); // ✅ No parameters!

  @override
  Widget build(BuildContext context) {
    final recentAppsManager = Provider.of<RecentAppsManager>(context);

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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Recent Apps',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (recentAppsManager.recentApps.isNotEmpty)
                        TextButton(
                          onPressed: () {
                            recentAppsManager.clearAll();
                          },
                          child: const Text('Clear All'),
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
                    child: recentAppsManager.recentApps.isEmpty
                        ? const Center(
                            child: Text(
                              'No recent apps',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.all(20),
                            itemCount: recentAppsManager.recentApps.length,
                            itemBuilder: (context, index) {
                              final app = recentAppsManager.recentApps[index];
                              return Card(
                                margin: const EdgeInsets.only(bottom: 16),
                                child: ListTile(
                                  leading: Image.asset(
                                    app.iconPath,
                                    width: 40,
                                    height: 40,
                                  ),
                                  title: Text(
                                    app.name,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  trailing: IconButton(
                                    icon: const Icon(Icons.close),
                                    onPressed: () {
                                      recentAppsManager.removeRecentApp(app.name);
                                    },
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => app.page,
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
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
