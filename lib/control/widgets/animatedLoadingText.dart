import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

AnimatedTextKit animatedLoading() {
  return AnimatedTextKit(
    animatedTexts: [
      FadeAnimatedText('Loading',
          textAlign: TextAlign.center,
          textStyle: const TextStyle(fontFamily: 'playfair', fontSize: 30)),
    ],
  );
}
