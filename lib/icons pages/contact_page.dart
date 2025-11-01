import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/widgets/bottom_buttons_bar.dart';
import 'package:portfolio/widgets/tablet_frame.dart';
import 'package:portfolio/widgets/tablet_screen.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});
  @override
  Widget build(BuildContext context) {
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
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Text(
                        '',
                        style: TextStyle(
                          color: Colors.white,
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
                          Colors.deepPurple.shade100,
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          elevation: 8.0,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Container(
                            width: 600,
                            height: 500,
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                  'arthurmorgan5984@gmail.com',
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
                                _buildSocialRow(
                                  'assets/animations/phone.json',
                                  'Phone',
                                  '+91 XXXXXXXXX',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                BottomButtonsBar(),
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
          width: 75,
          height: 75,
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
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              Text(
                username,
                style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
