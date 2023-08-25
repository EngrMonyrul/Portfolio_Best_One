import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

AnimatedTextKit animatedError(String txt1, String txt2) {
  return AnimatedTextKit(
    animatedTexts: [
      FadeAnimatedText(txt1,
          textAlign: TextAlign.center,
          textStyle: const TextStyle(fontFamily: 'playfair', fontSize: 30)),
      FadeAnimatedText(txt2,
          textAlign: TextAlign.center,
          textStyle: const TextStyle(fontFamily: 'playfair', fontSize: 30)),
    ],
  );
}
