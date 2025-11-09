import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../widgets/tablet_frame.dart';
import '../widgets/tablet_screen.dart';
import '../widgets/bottom_buttons_bar.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({Key? key}) : super(key: key);

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage>
    with SingleTickerProviderStateMixin {
  String _displayedText = '';
  final String _fullText =
      "A passionate Flutter Developer and Machine Learning Enthusiast crafting innovative mobile experiences. I specialize in building cross-platform applications with clean architecture and integrating intelligent ML solutions.\n\nCurrently pursuing B.Tech in Computer Science, constantly exploring the intersection of mobile development and artificial intelligence.";
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  void _startTyping() {
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (_currentIndex < _fullText.length) {
        setState(() {
          _displayedText = _fullText.substring(0, _currentIndex + 1);
          _currentIndex++;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TabletFrame(
          child: TabletScreen(
            child: Column(
              children: [
                // Content Area
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(

                        colors: [Color(0xFFB94CD5), Color(0xFF9B4CB8)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter, ),
                    ),
                    child: Column(
                      children: [
                        // App Bar
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.purple.shade700,
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
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              const Text(
                                'About Me',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Profile Content
                        Expanded(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                // Main profile card
                                Card(
                                  elevation: 40.0,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        // Profile Photo
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          child: Image.asset(
                                            'assets/images/developer_profile.jpg',
                                            width: 140,
                                            height: 140,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Container(
                                                width: 140,
                                                height: 140,
                                                color: Colors.grey.shade300,
                                                child: const Icon(
                                                  Icons.person,
                                                  size: 60,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 15),
                                        // Name and title - Fixed with Flexible
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Shreeyansh Janu',
                                                style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black87,
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(height: 6),
                                              Text(
                                                'Flutter Developer |\nML Enthusiast',
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.grey[600],
                                                  height: 1.3,
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 10),

                                // Two cards below
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Left card - Social Links
                                    Expanded(
                                      child: Card(
                                        elevation: 8.0,
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8.0,
                                          ),
                                        ),
                                        child: Container(
                                          height: 300,
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              _buildSocialRow(
                                                'assets/animations/github.json',
                                                'Github',
                                                'Shreeyanshjanu',
                                              ),
                                              _buildSocialRow(
                                                'assets/animations/instagram.json',
                                                'Instagram',
                                                'shreeyansh_janu',
                                              ),
                                              _buildSocialRow(
                                                'assets/animations/gmail.json',
                                                '@Gmail',
                                                'arthurmorgan5984',
                                              ),
                                              _buildSocialRow(
                                                'assets/animations/linkedin.json',
                                                'Linkedin',
                                                'shreeyanshjanu',
                                              ),
                                              _buildSocialRow(
                                                'assets/animations/earth.json',
                                                'Website',
                                                'coming soon',
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                    const SizedBox(width: 10),

                                    // Right card - Bio
                                    Expanded(
                                      child: Card(
                                        elevation: 8.0,
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8.0,
                                          ),
                                        ),
                                        child: Container(
                                          height: 300,
                                          padding: const EdgeInsets.all(16.0),
                                          child: SingleChildScrollView(
                                            child: Text(
                                              _displayedText,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontFamily: 'monospace',
                                                height: 1.6,
                                                letterSpacing: 0.5,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Bottom Buttons Bar
                const BottomButtonsBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialRow(String animationPath, String title, String username) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 45,
          height: 45,
          child: Lottie.asset(
            animationPath,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.link, size: 35);
            },
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              Text(
                username,
                style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
