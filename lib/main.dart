import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/control/providers/database_provider.dart';
import 'package:untitled2/view/splashScreen/splash_screen_view.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> DataBaseProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.light(),
        theme: ThemeData(
          fontFamily: 'playfair',
        ),
        home: SplashScreenView(),
      ),
    );
  }
}
