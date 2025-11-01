import 'package:flutter/material.dart';
import '../widgets/tablet_frame.dart';
import '../widgets/tablet_screen.dart';
import '../widgets/bottom_buttons_bar.dart';
import '../models/project_gallery_model.dart';

class ImageViewPage extends StatefulWidget {
  final ProjectGallery project;

  const ImageViewPage({Key? key, required this.project}) : super(key: key);

  @override
  State<ImageViewPage> createState() => _ImageViewPageState();
}

class _ImageViewPageState extends State<ImageViewPage> {
  int _currentImageIndex = 0;
  bool _isFullscreen = false;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentImageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextImage() {
    if (_currentImageIndex < widget.project.screenshots.length - 1) {
      setState(() {
        _currentImageIndex++;
        _pageController.animateToPage(
          _currentImageIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  void _previousImage() {
    if (_currentImageIndex > 0) {
      setState(() {
        _currentImageIndex--;
        _pageController.animateToPage(
          _currentImageIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  void _goToImage(int index) {
    setState(() {
      _currentImageIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  void _toggleFullscreen() {
    setState(() {
      _isFullscreen = !_isFullscreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isFullscreen) {
      return _buildFullscreenView();
    }

    return Scaffold(
      body: Center(
        child: TabletFrame(
          child: TabletScreen(
            child: Column(
              children: [
                // App Bar
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade700,
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
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Expanded(
                        child: Text(
                          widget.project.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),

                // Image Gallery Area (Full Height)
                Expanded(
                  child: Container(
                    color: Colors.black,
                    child: Stack(
                      children: [
                        // Main Image Display with PageView
                        PageView.builder(
                          controller: _pageController,
                          itemCount: widget.project.screenshots.length,
                          onPageChanged: (index) {
                            setState(() {
                              _currentImageIndex = index;
                            });
                          },
                          itemBuilder: (context, index) {
                            return InteractiveViewer(
                              minScale: 0.5,
                              maxScale: 4.0,
                              child: Center(
                                child: Image.asset(
                                  widget.project.screenshots[index],
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.grey.shade800,
                                      child: const Center(
                                        child: Icon(
                                          Icons.broken_image,
                                          size: 80,
                                          color: Colors.white54,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),

                        // Previous Button
                        if (_currentImageIndex > 0)
                          Positioned(
                            left: 16,
                            top: 0,
                            bottom: 100,
                            child: Center(
                              child: IconButton(
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                  size: 32,
                                ),
                                onPressed: _previousImage,
                                style: IconButton.styleFrom(
                                  backgroundColor: Colors.black.withOpacity(0.5),
                                  padding: const EdgeInsets.all(12),
                                ),
                              ),
                            ),
                          ),

                        // Next Button
                        if (_currentImageIndex <
                            widget.project.screenshots.length - 1)
                          Positioned(
                            right: 16,
                            top: 0,
                            bottom: 100,
                            child: Center(
                              child: IconButton(
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 32,
                                ),
                                onPressed: _nextImage,
                                style: IconButton.styleFrom(
                                  backgroundColor: Colors.black.withOpacity(0.5),
                                  padding: const EdgeInsets.all(12),
                                ),
                              ),
                            ),
                          ),

                        // Fullscreen Button
                        Positioned(
                          top: 16,
                          right: 16,
                          child: IconButton(
                            icon: const Icon(
                              Icons.fullscreen,
                              color: Colors.white,
                              size: 28,
                            ),
                            onPressed: _toggleFullscreen,
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ),

                        // Image Counter & Thumbnails at Bottom
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            color: Colors.black87,
                            child: Column(
                              children: [
                                // Page Indicator
                                Text(
                                  '${_currentImageIndex + 1} / ${widget.project.screenshots.length}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 8),

                                // Thumbnail Row
                                SizedBox(
                                  height: 70,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: widget.project.screenshots.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () => _goToImage(index),
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 4),
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: _currentImageIndex == index
                                                  ? Colors.deepPurple
                                                  : Colors.grey.shade700,
                                              width: 3,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            child: Image.asset(
                                              widget.project.screenshots[index],
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Container(
                                                  color: Colors.grey.shade700,
                                                  child: const Icon(
                                                    Icons.image,
                                                    color: Colors.white54,
                                                    size: 24,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Bottom Bar
                const BottomButtonsBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFullscreenView() {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Fullscreen Image Viewer
          Center(
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.project.screenshots.length,
              onPageChanged: (index) {
                setState(() {
                  _currentImageIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return InteractiveViewer(
                  minScale: 0.5,
                  maxScale: 5.0,
                  child: Center(
                    child: Image.asset(
                      widget.project.screenshots[index],
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(
                            Icons.broken_image,
                            size: 100,
                            color: Colors.white54,
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),

          // Exit Fullscreen Button
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: const Icon(
                Icons.fullscreen_exit,
                color: Colors.white,
                size: 32,
              ),
              onPressed: _toggleFullscreen,
              style: IconButton.styleFrom(
                backgroundColor: Colors.black.withOpacity(0.6),
              ),
            ),
          ),

          // Previous Button
          if (_currentImageIndex > 0)
            Positioned(
              left: 20,
              top: 0,
              bottom: 0,
              child: Center(
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: _previousImage,
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(0.6),
                  ),
                ),
              ),
            ),

          // Next Button
          if (_currentImageIndex < widget.project.screenshots.length - 1)
            Positioned(
              right: 20,
              top: 0,
              bottom: 0,
              child: Center(
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: _nextImage,
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(0.6),
                  ),
                ),
              ),
            ),

          // Image Counter
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${_currentImageIndex + 1} / ${widget.project.screenshots.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
