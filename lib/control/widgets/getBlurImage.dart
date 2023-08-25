import 'package:flutter/material.dart';
import 'package:untitled2/control/widgets/animatedWaitingText.dart';
import 'package:untitled2/control/widgets/blurBg.dart';

import 'animatedError.dart';
import 'animatedLoadingText.dart';
import 'image_binder.dart';
import 'loading_icon.dart';

FutureBuilder<Widget> buildBlurImageArea(
    AsyncSnapshot<List<String>> snapshot, index, context) {
  return FutureBuilder(
    future: getImageUrlWithBlur(snapshot.data![index]),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const SizedBox();
      } else if (snapshot.hasError) {
        return animatedError('Sorry!', 'Something Went Wrong!');
      }  else {
        return snapshot.data ?? Container();
      }
    },
  );
}
