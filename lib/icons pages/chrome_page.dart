import 'package:flutter/material.dart';
import 'package:portfolio/widgets/bottom_buttons_bar.dart';
import 'package:portfolio/widgets/tablet_frame.dart';
import 'package:portfolio/widgets/tablet_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ChromePage extends StatefulWidget {
  const ChromePage({super.key});

  @override
  State<ChromePage> createState() => _ChromePageState();
}

class _ChromePageState extends State<ChromePage> {
  late WebViewController _webViewController;
  final TextEditingController _searchController = TextEditingController();
  String _currentUrl = 'https://www.google.com';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    
    // Initialize WebView for non-web platforms
    if (!kIsWeb) {
      _initializeWebView();
    }
  }

  void _initializeWebView() {
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              _isLoading = true;
              _currentUrl = url;
              _searchController.text = url;
            });
          },
          onPageFinished: (url) {
            setState(() {
              _isLoading = false;
            });
          },
          onWebResourceError: (error) {
            print('WebView Error: ${error.description}');
          },
        ),
      )
      ..loadRequest(Uri.parse(_currentUrl));
  }

  void _search(String query) {
    String url;
    
    // Handle different input types
    if (query.startsWith('http://') || query.startsWith('https://')) {
      url = query;
    } else if (query.contains('.')) {
      // Likely a domain
      url = 'https://$query';
    } else {
      // Search query
      url = 'https://www.google.com/search?q=${Uri.encodeComponent(query)}';
    }
    
    if (!kIsWeb) {
      _webViewController.loadRequest(Uri.parse(url));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TabletFrame(
          child: TabletScreen(
            child: Column(
              children: [
                // Chrome-like Top Bar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // Back Button
                      IconButton(
                        icon: const Icon(Icons.arrow_back, size: 20),
                        onPressed: () async {
                          if (!kIsWeb && await _webViewController.canGoBack()) {
                            _webViewController.goBack();
                          } else {
                            Navigator.pop(context);
                          }
                        },
                      ),
                      
                      // Forward Button
                      IconButton(
                        icon: const Icon(Icons.arrow_forward, size: 20),
                        onPressed: () async {
                          if (!kIsWeb && await _webViewController.canGoForward()) {
                            _webViewController.goForward();
                          }
                        },
                      ),
                      
                      // Refresh Button
                      IconButton(
                        icon: const Icon(Icons.refresh, size: 20),
                        onPressed: () {
                          if (!kIsWeb) {
                            _webViewController.reload();
                          }
                        },
                      ),
                      
                      const SizedBox(width: 8),
                      
                      // Search Bar
                      Expanded(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              hintText: 'Google',
                              hintStyle: TextStyle(color: Colors.grey[600]),
                              prefixIcon: const Icon(Icons.search, size: 20),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.mic, size: 20),
                                onPressed: () {},
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                            ),
                            onSubmitted: (query) {
                              if (query.isNotEmpty) {
                                _search(query);
                              }
                            },
                          ),
                        ),
                      ),
                      
                      const SizedBox(width: 8),
                      
                      // Menu Button
                      IconButton(
                        icon: const Icon(Icons.more_vert, size: 20),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                
                // Loading Indicator
                if (!kIsWeb && _isLoading)
                  LinearProgressIndicator(
                    backgroundColor: Colors.grey[200],
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                
                // Browser Content
                Expanded(
                  child: !kIsWeb
                      ? WebViewWidget(controller: _webViewController)
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.language, size: 80, color: Colors.blue),
                              const SizedBox(height: 20),
                              const Text(
                                'Chrome Browser',
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Search on mobile/emulator\nWebView not supported on Web',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.grey[600]),
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

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
