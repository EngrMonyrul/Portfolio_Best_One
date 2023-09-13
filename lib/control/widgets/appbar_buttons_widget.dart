import 'package:flutter/material.dart';

GestureDetector buildAppBarButtons(icon, iconSize, onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Icon(
      icon,
      size: iconSize,
      color: Colors.grey,
    ),
  );
}
