import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:untitled2/control/widgets/animatedError.dart';
import 'package:untitled2/control/widgets/image_fetch.dart';
import 'package:untitled2/view/home%20screen/home_screen.dart';
import '../../control/widgets/animatedLoadingText.dart';
import '../../control/widgets/build_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final getImgs = ImageFetch();

  // ignore: non_constant_identifier_names
  ChangeScreen(){
    Future.delayed(const Duration(seconds: 12), () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const PortfolioHomeScreen()));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ChangeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<String>>(
          future: getImgs.fetchSplashImg(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return animatedError('Please!', 'Wait A While!');
            } else if (snapshot.hasError) {
              return animatedError('Sorry!', 'Something Went Wrong!');
            } else {
              return Stack(
                alignment: Alignment.center,
                children: [
                  buildImageArea(snapshot, 1, context),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.transparent,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: buildImageArea(snapshot, 0, context),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
