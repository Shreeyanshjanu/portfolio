import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback onTap;
  const AppIcon({
    super.key,
    required this.iconPath,
    required this.label,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                iconPath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, StackTrace) {
                  return Container(
                    color: Colors.teal.shade300,
                    child: const Icon(
                      Icons.apps,
                      color: Colors.white,
                      size: 40,
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
