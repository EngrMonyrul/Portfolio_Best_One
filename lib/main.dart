import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'dart:ui';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCscXtfRZlggjYmNYTGx20Y1hV1tmlVCwo",
        authDomain: "portfolio-75bdf.firebaseapp.com",
        projectId: "portfolio-75bdf",
        storageBucket: "portfolio-75bdf.appspot.com",
        messagingSenderId: "344218771696",
        appId: "1:344218771696:web:7e1fbff84941a8fce3e235",
        measurementId: "G-102CN0CFJD"
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<Widget> _getImageWidget() async {
    final Reference ref = FirebaseStorage.instance.ref().child('bgimg').child('wallpaperflare.com_wallpaper (1).jpg');
    final String url = await ref.getDownloadURL();

    return Image(
      image: CachedNetworkImageProvider(url),
      fit: BoxFit.contain,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Widget>(
        future: _getImageWidget(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return snapshot.data ?? Text('Image not available');
          }
        },
      ),
    );
  }
}
