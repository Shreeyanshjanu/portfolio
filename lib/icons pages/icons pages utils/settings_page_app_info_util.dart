import 'package:flutter/material.dart';
import 'package:portfolio/widgets/bottom_buttons_bar.dart';
import 'package:portfolio/widgets/tablet_frame.dart';
import 'package:portfolio/widgets/tablet_screen.dart';

class SettingsPageAppInfoUtil extends StatelessWidget {
  const SettingsPageAppInfoUtil({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TabletFrame(
          child: TabletScreen(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    // color: Colors.black,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        image: AssetImage('assets/images/about_phone.jpeg'),
                        fit: BoxFit.contain,
                      ),
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
}
