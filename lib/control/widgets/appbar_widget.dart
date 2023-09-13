import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../view/homeScreen/home_screen_view.dart';
import '../providers/apps_handler_provider.dart';
import 'appbar_buttons_widget.dart';
import 'appbar_circle_widgets.dart';

Container buildAppBar(Size screenSize, BuildContext context) {
  final appHandler = Provider.of<AppsHandlerProvider>(context, listen: false);
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 3),
    padding: const EdgeInsets.symmetric(horizontal: 5),
    height: screenSize.height * 0.05,
    width: screenSize.width,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.black),
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      boxShadow: const [
        BoxShadow(
            color: Colors.black,
            spreadRadius: 1,
            blurRadius: 30,
            offset: Offset(5, 5)),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            colorCircle(Colors.red),
            const SizedBox(width: 5),
            colorCircle(Colors.yellow),
            const SizedBox(width: 5),
            colorCircle(Colors.green),
            const SizedBox(width: 10),
            buildAppBarButtons(
              CupertinoIcons.sidebar_left,
              screenSize.height * 0.023,
              () {
                appHandler.setDrawer();
              },
            ),
          ],
        ),
        Row(
          children: [
            buildAppBarButtons(
              CupertinoIcons.shield_lefthalf_fill,
              screenSize.height * 0.023,
              () {
                appHandler.setDrawer();
              },
            ),
            const SizedBox(width: 5),
            Container(
              alignment: Alignment.center,
              height: screenSize.height * 0.035,
              width: screenSize.width * 0.5,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      buildAppBarButtons(
                        CupertinoIcons.search_circle,
                        screenSize.height * 0.023,
                        () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreenView(),
                            ),
                          );
                        },
                      ),
                      const Text(
                        'MD Monirul Islam - B.Sc Engr in CSE',
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'playfair',
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(width: 5),
            buildAppBarButtons(
              CupertinoIcons.refresh_circled,
              screenSize.height * 0.023,
              () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreenView()));
              },
            ),
          ],
        ),
        Row(
          children: [
            buildAppBarButtons(
              CupertinoIcons.share,
              screenSize.height * 0.02,
              () async {
                Clipboard.setData(
                  const ClipboardData(text: 'https://www.google.com'),
                );

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    content: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: screenSize.height * 0.8,
                          width: screenSize.width,
                          child: Lottie.asset(
                            'assets/icons/animation_lmhjlzz2.json',
                            fit: BoxFit.contain,
                          ),
                        ),
                        const Positioned(
                          top: 0,
                          child: Text(
                            'Link Copied To Your Clipboard',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'playfair',
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(width: 5),
            buildAppBarButtons(
              CupertinoIcons.xmark_seal,
              screenSize.height * 0.02,
              () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ],
    ),
  );
}
