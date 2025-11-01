import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:portfolio/l10n/app_localizations.dart';
import 'package:portfolio/widgets/tablet_frame.dart';
import 'package:portfolio/widgets/tablet_screen.dart';
import 'package:video_player/video_player.dart';
import 'package:portfolio/widgets/bottom_buttons_bar.dart';

// Only import cloudinary_flutter on mobile platforms
import 'package:cloudinary_flutter/cloudinary_object.dart';
import 'package:cloudinary_flutter/video/cld_video_controller.dart';

class BloomBoom extends StatefulWidget {
  const BloomBoom({super.key});

  @override
  _BloomBoomState createState() => _BloomBoomState();
}

class _BloomBoomState extends State<BloomBoom> {
  CldVideoController? _mobileController;
  VideoPlayerController? _webController;
  bool _isInitialized = false;

  // Your Cloudinary credentials
  final String cloudName = 'dyr7jlczr';
  final String publicId = 'vidma_recorder_21102025_132251_1_nsyd8v';

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  void _initializePlayer() {
    if (kIsWeb) {
      // For Web: Use direct Cloudinary video URL with standard video_player
      _webController = VideoPlayerController.networkUrl(
        Uri.parse(
          'https://res.cloudinary.com/$cloudName/video/upload/$publicId.mp4',
        ),
      )..initialize().then((_) {
          setState(() {
            _isInitialized = true;
          });
          _webController!.play();
          _webController!.setLooping(true);
        }).catchError((error) {
          print('Error initializing web video: $error');
        });
    } else {
      // For Mobile: Use cloudinary_flutter
      final cloudinary = CloudinaryObject.fromCloudName(
        cloudName: cloudName,
      );

      _mobileController = CldVideoController(
        cloudinary: cloudinary,
        publicId: publicId,
      )..initialize().then((_) {
          setState(() {
            _isInitialized = true;
          });
          _mobileController!.play();
          _mobileController!.setLooping(true);
        }).catchError((error) {
          print('Error initializing mobile video: $error');
        });
    }
  }

  @override
  void dispose() {
    _mobileController?.dispose();
    _webController?.dispose();
    super.dispose();
  }

  Widget _buildVideoPlayer() {
    if (!_isInitialized) {
      return Container(
        height: 400,
        color: Colors.black,
        child: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      );
    }

    if (kIsWeb) {
      // Web video player
      return AspectRatio(
        aspectRatio: _webController!.value.aspectRatio,
        child: VideoPlayer(_webController!),
      );
    } else {
      // Mobile video player
      return AspectRatio(
        aspectRatio: _mobileController!.value.aspectRatio,
        child: VideoPlayer(_mobileController!),
      );
    }
  }

  bool _isPlaying() {
    if (kIsWeb) {
      return _webController?.value.isPlaying ?? false;
    } else {
      return _mobileController?.value.isPlaying ?? false;
    }
  }

  void _togglePlayPause() {
    setState(() {
      if (kIsWeb) {
        if (_webController!.value.isPlaying) {
          _webController!.pause();
        } else {
          _webController!.play();
        }
      } else {
        if (_mobileController!.value.isPlaying) {
          _mobileController!.pause();
        } else {
          _mobileController!.play();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                      Text(
                        '${AppLocalizations.of(context)!.bloomBoom} - Demo',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // Main Content
                Expanded(
                  child: Container(
                    width: double.infinity,
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
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          // Video Player
                          Container(
                            constraints: BoxConstraints(maxHeight: 650),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 10,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: ClipRect(
                                child: _buildVideoPlayer(),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Play/Pause Button
                          ElevatedButton.icon(
                            icon: Icon(
                              _isPlaying() ? Icons.pause : Icons.play_arrow,
                            ),
                            label: Text(
                              _isPlaying() ? 'Pause' : 'Play',
                            ),
                            onPressed: _togglePlayPause,
                          ),

                          const SizedBox(height: 30),

                          // Warning Box
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.orange.shade50,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.black, width: 2),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.warning_amber_rounded,
                                      color: Colors.red,
                                      size: 30,
                                    ),
                                    const SizedBox(width: 12),
                                    const Expanded(
                                      child: Text(
                                        'Android Only APK',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                const Text(
                                  'This APK file works only on Android devices. Do not download on PC/Laptop.\n\nDownload link:\nhttps://drive.google.com/file/d/18XOge2QP2-bZwB69F-npsTpg8ftPLUyj/view?usp=drive_link',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ],
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
}
