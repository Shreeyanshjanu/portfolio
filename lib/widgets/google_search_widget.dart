import 'package:flutter/material.dart';
import 'package:portfolio/icons%20pages/chrome_page.dart';


class GoogleSearchWidget extends StatelessWidget {
  const GoogleSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            child: Icon(Icons.search, color: Colors.grey[600], size: 24),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChromePage()),
              );
            },
          ),
          SizedBox(width: 20),
          GestureDetector(
            child: Text(
              'Google',
              style: TextStyle(color: Colors.grey[600], fontSize: 16),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChromePage()),
              );
            },
          ),
          Spacer(),
          GestureDetector(
            child: Icon(Icons.mic, color: Colors.grey[600], size: 24),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChromePage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
