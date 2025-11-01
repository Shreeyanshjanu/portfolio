import 'package:flutter/material.dart';

class TabletFrame extends StatelessWidget {
  final Widget child;

  const TabletFrame({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 1280,
      width: 800,
      decoration: BoxDecoration(
        color: const Color(0xFF3f3e42),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(child: child),
    );
  }
}
