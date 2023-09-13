import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled2/view/homeScreen/home_screen_view.dart';

import '../../control/functions/image_fetch.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  final dataFetch = ImageFetch();

  fetchDatabase() async {
    await dataFetch.fetchBgImg();
    await dataFetch.fetchLoadingImg();
    await dataFetch.fetchProfileImg();
    await dataFetch.fetchSplashImg();

    Future.delayed(const Duration(seconds: 2), (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreenView()));
    });
  }

  @override
  void initState() {
    fetchDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/icons/animation_lmbpchdd.json'),
      ),
    );
  }
}
