import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/control/widgets/image_fetch.dart';

import 'animatedError.dart';
import 'animatedLoadingText.dart';
import 'animatedWaitingText.dart';
import 'loadingImageContainer.dart';

Container buildWatingIcon(BuildContext context) {
  final getImgs = ImageFetch();
  return Container(
    height: MediaQuery.of(context).size.height * 0.1,
    child: FutureBuilder(
      future: getImgs.fetchLoadingImg(),
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return animatedWaiting();
        } else if (snapshot.hasError) {
          return animatedError('Sorry!', 'Something Went Wrong');
        } else {
          return loadingImageContainer(context, snapshot);
        }
      },
    ),
  );
}
