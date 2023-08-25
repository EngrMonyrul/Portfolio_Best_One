import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

AnimatedTextKit animatedWaiting() {
  return AnimatedTextKit(
    animatedTexts: [
      FadeAnimatedText('Please Wait',
          textAlign: TextAlign.center,
          textStyle: const TextStyle(fontFamily: 'playfair', fontSize: 30)),
    ],
  );
}
