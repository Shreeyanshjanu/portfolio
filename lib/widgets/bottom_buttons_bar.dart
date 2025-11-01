import 'package:flutter/material.dart';
import 'package:portfolio/pages/home_page.dart';
import 'package:portfolio/pages/recent_apps_page.dart';

class BottomButtonsBar extends StatelessWidget {
  const BottomButtonsBar({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ Check if we can pop (if we're not on the first/home page)
    final canPop = Navigator.canPop(context);

    return Container(
      width: double.infinity,
      height: 60,
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Back Button - Only works if not on home page
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: canPop ? Colors.white : Colors.grey, // ✅ Grey out if can't go back
              size: 28,
            ),
            onPressed: canPop ? () => Navigator.pop(context) : null, // ✅ Disabled if on home
          ),
          // Home Button
          IconButton(
            icon: const Icon(Icons.circle_outlined, color: Colors.white, size: 24),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
                (route) => false,
              );
            },
          ),
          // Recent Apps Button
          IconButton(
            icon: const Icon(Icons.crop_square_rounded, color: Colors.white, size: 24),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RecentAppsPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
