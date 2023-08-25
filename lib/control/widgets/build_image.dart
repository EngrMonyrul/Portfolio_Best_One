import 'package:flutter/material.dart';
import 'package:untitled2/control/widgets/animatedWaitingText.dart';

import 'animatedError.dart';
import 'animatedLoadingText.dart';
import 'image_binder.dart';
import 'loading_icon.dart';

FutureBuilder<Widget> buildImageArea(
    AsyncSnapshot<List<String>> snapshot, index, context) {
  return FutureBuilder(
    future: getImageUrl(snapshot.data![index]),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const SizedBox();
      } else if (snapshot.hasError) {
        return const SizedBox();
      }  else {
        return snapshot.data ?? Container();
      }
    },
  );
}
