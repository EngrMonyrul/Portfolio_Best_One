import 'dart:async';
import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/control/widgets/image_fetch.dart';
import 'package:animate_do/animate_do.dart';
import '../../control/providers/index_provider.dart';
import '../../control/widgets/animatedError.dart';
import '../../control/widgets/animatedLoadingText.dart';
import '../../control/widgets/build_image.dart';
import '../../control/widgets/getBlurImage.dart';

class PortfolioHomeScreen extends StatefulWidget {
  const PortfolioHomeScreen({super.key});

  @override
  State<PortfolioHomeScreen> createState() => _PortfolioHomeScreenState();
}

class _PortfolioHomeScreenState extends State<PortfolioHomeScreen> {
  final imgFetch = ImageFetch();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<IndexProvider>(builder: (context, property, child) {
          final getIndex = Provider.of<IndexProvider>(context, listen: false);
          Timer.periodic(const Duration(minutes: 10), (timer) {
            getIndex.changeIndex();
          });
          return Stack(
            alignment: Alignment.center,
            children: [
              FutureBuilder<List<String>>(
                future: imgFetch.fetchBgImg(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return animatedError('Loading...', 'Please Wait!');
                  } else if (snapshot.hasError) {
                    return Container();
                  } else {
                    return Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: buildBlurImageArea(
                            snapshot, property.index, context));
                  }
                },
              ),
              FutureBuilder<List<String>>(
                future: imgFetch.fetchBgImg(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container();
                  } else if (snapshot.hasError) {
                    return Container();
                  } else {
                    return Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height * 0.9,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    spreadRadius: 2,
                                    blurRadius: 40,
                                  ),
                                ]),
                            child: buildImageArea(
                                snapshot, property.index, context)),
                        BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.9,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 300),
                            height: MediaQuery.of(context).size.height * 0.9,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: FutureBuilder<List<String>>(
                                    future: imgFetch.fetchProfileImg(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return SizedBox(
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: animatedLoading());
                                      } else if (snapshot.hasError) {
                                        return SizedBox(
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: animatedError('Sorry!',
                                                'Something Went Wrong!'));
                                      } else {
                                        return buildImageArea(
                                            snapshot, 0, context);
                                      }
                                    },
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: SizedBox(
                                            width: double.infinity,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                FadeInUpBig(
                                                  child: const Text(
                                                    'Monirul Islam',
                                                    style: TextStyle(
                                                      color: Colors.pink,
                                                      fontSize: 30,
                                                      fontFamily: 'playfair',
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 40,
                                                  child: FadeIn(
                                                    delay: const Duration(
                                                        seconds: 1),
                                                    child: AnimatedTextKit(
                                                      isRepeatingAnimation:
                                                          true,
                                                      repeatForever: true,
                                                      animatedTexts: [
                                                        FadeAnimatedText(
                                                            'A Computer Engineer (CSE)',
                                                            textStyle:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 20,
                                                              fontFamily:
                                                                  'playfair',
                                                            )),
                                                        FadeAnimatedText(
                                                            'From Bangladesh',
                                                            textStyle:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 20,
                                                              fontFamily:
                                                                  'playfair',
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    property.setaboutme();
                                                  });
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 5),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    border: property.aboutme
                                                        ? Border.all(
                                                            color: Colors.pink)
                                                        : Border.all(
                                                            color:
                                                                Colors.black),
                                                  ),
                                                  child: Text(
                                                    'About Me',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'playfair'),
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 5),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    border: Border.all(
                                                        color: Colors.black),
                                                  ),
                                                  child: Text(
                                                    'My CV',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'playfair'),
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 5),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    border: Border.all(
                                                        color: Colors.black),
                                                  ),
                                                  child: Text(
                                                    'Services',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'playfair'),
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 5),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    border: Border.all(
                                                        color: Colors.black),
                                                  ),
                                                  child: Text(
                                                    'Contact',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'playfair'),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  }
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
