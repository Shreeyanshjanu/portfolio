import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:portfolio/utils/app_settings_manager.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/widgets/bottom_buttons_bar.dart';
import 'package:portfolio/widgets/tablet_frame.dart';
import 'package:portfolio/widgets/tablet_screen.dart';

class SettingsPageLightDarkModeUtil extends StatefulWidget {
  const SettingsPageLightDarkModeUtil({super.key}); // ✅ No parameters!

  @override
  State<SettingsPageLightDarkModeUtil> createState() =>
      _SettingsPageLightDarkModeUtilState();
}

class _SettingsPageLightDarkModeUtilState extends State<SettingsPageLightDarkModeUtil> {
  late double _currentBrightness;

  @override
  void initState() {
    super.initState();
    // ✅ Get initial value from Provider!
    _currentBrightness = Provider.of<AppSettingsManager>(context, listen: false).brightness;
  }

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
                        icon: const Icon(Icons.arrow_back, color: Colors.black87),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Text(
                        localizations.darkLightMode,
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
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Preview Box
                          Container(
                            width: 300,
                            height: 200,
                            margin: const EdgeInsets.symmetric(horizontal: 40),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.brightness_6,
                                        size: 60,
                                        color: Colors.deepPurple.shade300,
                                      ),
                                      const SizedBox(height: 16),
                                      const Text(
                                        'Brightness Preview',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      const Text(
                                        'Sample text content',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(1 - _currentBrightness),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
                          // Slider
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 60),
                            child: Row(
                              children: [
                                const Icon(Icons.brightness_low, color: Colors.white),
                                Expanded(
                                  child: Slider(
                                    value: _currentBrightness,
                                    min: 0.3,
                                    max: 1.0,
                                    divisions: 7,
                                    label: '${(_currentBrightness * 100).round()}%',
                                    onChanged: (value) {
                                      setState(() => _currentBrightness = value);
                                      // ✅ Update Provider!
                                      Provider.of<AppSettingsManager>(context, listen: false).changeBrightness(value);
                                    },
                                  ),
                                ),
                                const Icon(Icons.brightness_high, color: Colors.white),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            '${(_currentBrightness * 100).round()}%',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 40),
                          // Preset Buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  setState(() => _currentBrightness = 0.4);
                                  Provider.of<AppSettingsManager>(context, listen: false).changeBrightness(0.4);
                                },
                                icon: const Icon(Icons.brightness_3, size: 18),
                                label: const Text('Dim'),
                              ),
                              const SizedBox(width: 16),
                              ElevatedButton.icon(
                                onPressed: () {
                                  setState(() => _currentBrightness = 0.7);
                                  Provider.of<AppSettingsManager>(context, listen: false).changeBrightness(0.7);
                                },
                                icon: const Icon(Icons.brightness_5, size: 18),
                                label: const Text('Medium'),
                              ),
                              const SizedBox(width: 16),
                              ElevatedButton.icon(
                                onPressed: () {
                                  setState(() => _currentBrightness = 1.0);
                                  Provider.of<AppSettingsManager>(context, listen: false).changeBrightness(1.0);
                                },
                                icon: const Icon(Icons.brightness_7, size: 18),
                                label: const Text('Bright'),
                              ),
                            ],
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
