import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

Future<Widget> getImageUrl(String imgPath) async {
  final Reference ref = FirebaseStorage.instance.ref().child(imgPath);
  final String url = await ref.getDownloadURL();

  return ClipRRect(
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    child: Image(
      image: CachedNetworkImageProvider(url),
      fit: BoxFit.fitHeight,
      height: double.infinity,
      width: double.infinity,
    ),
  );
}
