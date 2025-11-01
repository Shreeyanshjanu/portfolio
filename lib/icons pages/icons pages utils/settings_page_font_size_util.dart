import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:portfolio/utils/app_settings_manager.dart';
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/widgets/bottom_buttons_bar.dart';
import 'package:portfolio/widgets/tablet_frame.dart';
import 'package:portfolio/widgets/tablet_screen.dart';

class SettingsPageFontSizeUtil extends StatefulWidget {
  const SettingsPageFontSizeUtil({super.key}); // ✅ No parameters!

  @override
  State<SettingsPageFontSizeUtil> createState() => _SettingsPageFontSizeUtilState();
}

class _SettingsPageFontSizeUtilState extends State<SettingsPageFontSizeUtil> {
  late double _currentScale;

  @override
  void initState() {
    super.initState();
    // ✅ Get initial value from Provider!
    _currentScale = Provider.of<AppSettingsManager>(context, listen: false).textScaleFactor;
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
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 4, offset: const Offset(0, 2))],
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black87),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Text(localizations.fontSize, style: const TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold)),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.symmetric(horizontal: 40),
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                            child: Text('Preview Text - sample', style: TextStyle(fontSize: 16 * _currentScale, color: Colors.black87)),
                          ),
                          const SizedBox(height: 40),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 60),
                            child: Row(
                              children: [
                                const Icon(Icons.text_decrease, color: Colors.white),
                                Expanded(
                                  child: Slider(
                                    value: _currentScale,
                                    min: 0.8,
                                    max: 1.5,
                                    divisions: 7,
                                    label: '${(_currentScale * 100).round()}%',
                                    onChanged: (value) {
                                      setState(() => _currentScale = value);
                                      // ✅ Update Provider!
                                      Provider.of<AppSettingsManager>(context, listen: false).changeFontSize(value);
                                    },
                                  ),
                                ),
                                const Icon(Icons.text_increase, color: Colors.white),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text('${(_currentScale * 100).round()}%', style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  setState(() => _currentScale = 0.8);
                                  Provider.of<AppSettingsManager>(context, listen: false).changeFontSize(0.8);
                                },
                                child: const Text('small'),
                              ),
                              const SizedBox(width: 16),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() => _currentScale = 1.0);
                                  Provider.of<AppSettingsManager>(context, listen: false).changeFontSize(1.0);
                                },
                                child: const Text('Normal'),
                              ),
                              const SizedBox(width: 16),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() => _currentScale = 1.3);
                                  Provider.of<AppSettingsManager>(context, listen: false).changeFontSize(1.3);
                                },
                                child: const Text('Large'),
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
