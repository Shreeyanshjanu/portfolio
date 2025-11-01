import 'package:flutter/material.dart';

class RecentAppsManager extends ChangeNotifier {
  final List<RecentApp> _recentApps = [];
  final int maxRecentApp = 5;
  
  List<RecentApp> get recentApps => List.unmodifiable(_recentApps);

  void addRecentApp(RecentApp app) {
    _recentApps.removeWhere((a) => a.name == app.name);
    _recentApps.insert(0, app);
    if (_recentApps.length > maxRecentApp) {
      _recentApps.removeLast();
    }
    notifyListeners();
  }

  void removeRecentApp(String name) {
    _recentApps.removeWhere((a) => a.name == name);
    notifyListeners();
  }

  void clearAll() {
    _recentApps.clear();
    notifyListeners();
  }
}

class RecentApp {
  final String name;
  final String iconPath;
  final Widget page;

  RecentApp({
    required this.name,
    required this.iconPath,
    required this.page,
  });
}
