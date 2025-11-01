import '../models/project_gallery_model.dart';

final List<ProjectGallery> projectGalleries = [
  ProjectGallery(
    name: 'E-Commerce App',
    shortDescription: 'Full-featured shopping app with Firebase',
    fullDescription:
        'A comprehensive e-commerce application built with Flutter and Firebase. Features include user authentication with OTP verification, shopping cart management, order tracking, address management, and product categorization. Integrated Firebase Cloud Firestore for real-time data synchronization and Firebase Authentication for secure user login.',
    coverImage: 'assets/projects images/bloom boom/login.jpeg',
    screenshots: [
      'assets/projects images/bloom boom/login.jpeg',
      'assets/projects images/bloom boom/signup.jpeg',
      'assets/projects images/bloom boom/home_page.jpeg',
      'assets/projects images/bloom boom/best_deals.jpeg',
      'assets/projects images/bloom boom/ocassion.jpeg',
      'assets/projects images/bloom boom/details.jpeg',
      'assets/projects images/bloom boom/cart.jpeg',
      'assets/projects images/bloom boom/fav.jpeg',
      'assets/projects images/bloom boom/checkout.jpeg',
      'assets/projects images/bloom boom/orders.jpeg',
      'assets/projects images/bloom boom/order_confirmation.jpeg',
      'assets/projects images/bloom boom/sidebar.jpeg',
      'assets/projects images/bloom boom/address.jpeg',
      'assets/projects images/bloom boom/developer_profile.jpeg',
      'assets/projects images/bloom boom/logout.jpeg',
    ],
    techStack: 'Flutter • Firebase • Provider • Dart',
    duration: 'September 2024 - October 2024',
    feautures: [
      'Firebase Authentication with OTP',
      'Real-time Cart Management',
      'Order History Tracking',
      'Multiple Address Support',
      'Product Category Filtering',
      'Push Notifications',
    ],
  ),

  ProjectGallery(
    name: 'YLEMPO Music App',
    shortDescription: 'YouTube music player with organizer',
    fullDescription:
        'A full-stack music streaming application with Flutter frontend and FastAPI backend. Features PostgreSQL database integration for user and music library management, JWT-based authentication, dynamic audio/video links, genre filtering, and cloud storage integration. Implements RESTful API architecture with comprehensive documentation.',
    coverImage: 'assets/projects images/ylfmpo/home_page.png',
    screenshots: [
      'assets/projects images/ylfmpo/login.png',
      'assets/projects images/ylfmpo/home_page.png',
      'assets/projects images/ylfmpo/library.png',
      'assets/projects images/ylfmpo/link_paste.png',
      'assets/projects images/ylfmpo/settings.png',
    ],
    techStack: 'Flutter • FastAPI • PostgreSQL • Python • JWT',
    duration: 'August 2024 - September 2024',
    feautures: [
      'RESTful API Backend',
      'JWT Authentication',
      'PostgreSQL Database',
      'Music Library Management',
      'Genre Filtering',
      'YouTube Link Integration',
    ],
  ),
];
