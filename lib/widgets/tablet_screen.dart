import 'package:flutter/material.dart';
import 'status_bar.dart';

class TabletScreen extends StatelessWidget {
  final Widget child;

  const TabletScreen({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(40),
      height: 1200,
      width: 720,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: [
            // Status Bar
            const StatusBar(),
            
            // Main Content Area
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/android_background.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: child, // Your portfolio content goes here
              ),
            ),
          ],
        ),
      ),
    );
  }
}
