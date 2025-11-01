import 'package:flutter/material.dart';
import '../widgets/tablet_frame.dart';
import '../widgets/tablet_screen.dart';
import '../widgets/bottom_buttons_bar.dart';

class CVPage extends StatefulWidget {
  const CVPage({Key? key}) : super(key: key);

  @override
  State<CVPage> createState() => _CVPageState();
}

class _CVPageState extends State<CVPage> {
  double _scale = 1.0;
  final TransformationController _transformationController =
      TransformationController();

  void _zoomIn() {
    setState(() {
      _scale = (_scale + 0.2).clamp(0.5, 3.0);
      _transformationController.value = Matrix4.identity()..scale(_scale);
    });
  }

  void _zoomOut() {
    setState(() {
      _scale = (_scale - 0.2).clamp(0.5, 3.0);
      _transformationController.value = Matrix4.identity()..scale(_scale);
    });
  }

  void _resetZoom() {
    setState(() {
      _scale = 1.0;
      _transformationController.value = Matrix4.identity();
    });
  }

  @override
  void dispose() {
    _transformationController.dispose();
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
                // App Bar with Back Button and Zoom Controls
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
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
                      // Back Button
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Text(
                        'My CV',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),

                      // Zoom Controls
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade700,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.zoom_out,
                                color: Colors.white,
                              ),
                              onPressed: _zoomOut,
                              tooltip: 'Zoom Out',
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: Text(
                                '${(_scale * 100).toInt()}%',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.zoom_in,
                                color: Colors.white,
                              ),
                              onPressed: _zoomIn,
                              tooltip: 'Zoom In',
                            ),
                            Container(
                              width: 1,
                              height: 24,
                              color: Colors.grey.shade600,
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.refresh,
                                color: Colors.white,
                              ),
                              onPressed: _resetZoom,
                              tooltip: 'Reset Zoom',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // CV Content with InteractiveViewer (Zoom + Scroll)
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: Colors.grey[300],
                    child: InteractiveViewer(
                      transformationController: _transformationController,
                      minScale: 0.5,
                      maxScale: 3.0,
                      boundaryMargin: const EdgeInsets.all(100),
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        width: 595, // A4 width
                        height: 1400, // Increased height for both projects
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            // Left sidebar - Light grey background
                            Container(
                              width: 200,
                              decoration: BoxDecoration(
                                color: const Color(0xFFE8E8E8),
                                border: Border(
                                  right: BorderSide(
                                    color: Colors.grey[300]!,
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 30,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Contact Information
                                    _buildContactRow(
                                      Icons.email_outlined,
                                      'arthurmorgan5984@gmail.com',
                                    ),
                                    const SizedBox(height: 10),
                                    _buildContactRow(
                                      Icons.phone_outlined,
                                      '+91 9352045561',
                                    ),
                                    const SizedBox(height: 10),
                                    _buildContactRow(
                                      Icons.location_on_outlined,
                                      'Rajasthan,India',
                                    ),
                                    const SizedBox(height: 10),
                                    _buildContactRow(
                                      Icons.laptop_mac_outlined,
                                      'shreeyanshjanu',
                                    ),
                                    const SizedBox(height: 10),
                                    _buildContactRow(
                                      Icons.code_outlined,
                                      'Shreeyanshjanu',
                                    ),

                                    const SizedBox(height: 35),

                                    // SKILLS Section
                                    const Text(
                                      'SKILLS',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    _buildBulletPoint('Flutter'),
                                    _buildBulletPoint('FastAPI'),
                                    _buildBulletPoint('Firebase'),
                                    _buildBulletPoint('PostgreSQL'),
                                    _buildBulletPoint('Python'),
                                    _buildBulletPoint(
                                      'Data Structure & Algorithm',
                                    ),
                                    _buildBulletPoint('C++'),
                                    const SizedBox(height: 35),

                                    // EDUCATION Section
                                    const Text(
                                      'EDUCATION',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    const Text(
                                      'B.Tech in Information Technology - 8.01 GPA',
                                      style: TextStyle(
                                        fontSize: 9.5,
                                        fontWeight: FontWeight.w600,
                                        height: 1.4,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    const Text(
                                      'LOVELY PROFESSIONAL UNIVERSITY',
                                      style: TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w500,
                                        height: 1.3,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    const Text(
                                      'June 2024 - June 2028',
                                      style: TextStyle(
                                        fontSize: 8.5,
                                        color: Colors.black54,
                                        height: 1.3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Right content area - White background
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  35,
                                  30,
                                  35,
                                  30,
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Name Header
                                      const Text(
                                        'SHREEYANSH',
                                        style: TextStyle(
                                          fontSize: 38,
                                          fontWeight: FontWeight.w900,
                                          letterSpacing: 3,
                                          height: 1.0,
                                        ),
                                      ),
                                      const Text(
                                        'JANU',
                                        style: TextStyle(
                                          fontSize: 38,
                                          fontWeight: FontWeight.w900,
                                          letterSpacing: 3,
                                          height: 1.2,
                                        ),
                                      ),

                                      const SizedBox(height: 28),

                                      // PROFILE Section
                                      const Text(
                                        'PROFILE',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      const Text(
                                        'I am a passionate and detail-oriented Flutter Android developer with a strong foundation in Data Structures and Algorithms, proficient in Flutter, Firebase, Python, C++, FastAPI, and PostgreSQL. Skilled in applying efficient algorithms and optimizing data structures to build scalable and performant mobile applications for Android. I excel at transforming complex requirements into robust, user-friendly Android apps. Throughout my projects, I have demonstrated technical expertise in designing secure authentication systems, integrating efficient databases, and implementing seamless cloud functionalities. With a collaborative mindset and commitment to quality, I deliver Android applications that balance performance, reliability, and an excellent user experience.',
                                        style: TextStyle(
                                          fontSize: 9,
                                          height: 1.5,
                                          color: Colors.black87,
                                        ),
                                        textAlign: TextAlign.justify,
                                      ),

                                      const SizedBox(height: 25),

                                      // PROJECTS Section
                                      const Text(
                                        'PROJECTS',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                      const SizedBox(height: 10),

                                      // Project 1: YLEMPO
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Expanded(
                                            child: Text(
                                              'YLEMPO-Youtube Link Fetch Music Player and Organizer',
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                height: 1.3,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          Icon(
                                            Icons.open_in_new,
                                            size: 11,
                                            color: Colors.black87,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      const Text(
                                        '20 august 2025 - 7 september 2025',
                                        style: TextStyle(
                                          fontSize: 8.5,
                                          color: Colors.black54,
                                          height: 1.3,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      const Text(
                                        'Developed a full-stack music streaming application featuring a Flutter frontend and a FastAPI backend with PostgreSQL integration. Implemented RESTful APIs for user authentication, music library management, and secure data handling. Designed relational database models for users and songs, enabling smooth playlist creation and management. Integrated advanced features such as dynamic audio/video links, genre filtering, and integration with Firebase for scalable data storage. The project incorporates JWT-based security, environment variable management, and best practices for API documentation and deployment. Demonstrated proficiency in cross-platform mobile development, backend engineering, cloud integration, and modern authentication techniques.',
                                        style: TextStyle(
                                          fontSize: 9,
                                          height: 1.5,
                                          color: Colors.black87,
                                        ),
                                        textAlign: TextAlign.justify,
                                      ),

                                      const SizedBox(height: 20),

                                      // Project 2: Bloom Boom
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Expanded(
                                            child: Text(
                                              'Bloom Boom - Flower Delivery Mobile Application',
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                height: 1.3,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          Icon(
                                            Icons.open_in_new,
                                            size: 11,
                                            color: Colors.black87,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      const Text(
                                        'September 2025 - October 2025',
                                        style: TextStyle(
                                          fontSize: 8.5,
                                          color: Colors.black54,
                                          height: 1.3,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      const Text(
                                        'Bloom Boom is a comprehensive flower delivery mobile application developed with Flutter and Firebase, designed to provide a seamless shopping experience for flower enthusiasts. The app features secure email-based authentication, an extensive flower catalog organized by categories (pink, white, purple, yellow), and dynamic image loading from Firebase Storage for optimal performance. Key functionalities include a shopping cart system, a persistent favorites page for saving preferred flowers across sessions, and smooth navigation throughout the app. Built with Riverpod for state management and Firestore for real-time database operations, Bloom Boom delivers a complete e-commerce solution for ordering beautiful blooms directly from Android devices.',
                                        style: TextStyle(
                                          fontSize: 9,
                                          height: 1.5,
                                          color: Colors.black87,
                                        ),
                                        textAlign: TextAlign.justify,
                                      ),

                                      const SizedBox(height: 25),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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

  Widget _buildContactRow(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 13, color: Colors.black87),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 8.5,
              height: 1.4,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 10, height: 1.3)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 9,
                height: 1.3,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
