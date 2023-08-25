import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

Future<Widget> getImageUrlWithBlur(String imgPath) async {
  final Reference ref = FirebaseStorage.instance.ref().child(imgPath);
  final String url = await ref.getDownloadURL();

  return Opacity(
    opacity: 0.5,
    child: Stack(
      children: [
        Image(
          image: CachedNetworkImageProvider(url),
          fit: BoxFit.fill,
          height: double.infinity,
          width: double.infinity,
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.transparent,
          ),
        )
      ],
    ),
  );
}
