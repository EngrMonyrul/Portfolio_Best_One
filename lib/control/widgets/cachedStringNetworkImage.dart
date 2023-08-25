import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'animatedError.dart';
import 'animatedLoadingText.dart';

CachedNetworkImage cachedNetworkImage(AsyncSnapshot<String> snapshot) {
  return CachedNetworkImage(
    imageUrl: snapshot.data!,
    fit: BoxFit.fitHeight,
    placeholder: (context, url) {
      return animatedLoading();
    },
    errorWidget: (context, url, error) {
      return animatedError('Sorry!', 'Something Went Wrong');
    },
  );
}
