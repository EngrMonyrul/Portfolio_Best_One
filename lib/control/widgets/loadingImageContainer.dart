import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'animatedError.dart';
import 'animatedLoadingText.dart';
import 'cachedStringNetworkImage.dart';

Container loadingImageContainer(
    BuildContext context, AsyncSnapshot<String> snapshot) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.1,
    width: MediaQuery.of(context).size.width * 0.5,
    child: cachedNetworkImage(snapshot),
  );
}
