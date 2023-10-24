import 'package:flutter/material.dart';

TextStyle onBackgroundTextStyle(context, double fSize) {
  return TextStyle(
    color: Theme.of(context).colorScheme.onBackground,
    fontSize: fSize,
  );
}

TextStyle onPrimaryTextStyle(context, double fSize) {
  return TextStyle(
    color: Theme.of(context).colorScheme.onPrimary,
    fontSize: fSize,
  );
}

TextStyle onSecondaryTextStyle(context, double fSize) {
  return TextStyle(
    color: Theme.of(context).colorScheme.onSecondary,
    fontSize: fSize,
  );
}

TextStyle onTertiaryTextStyle(context, double fSize) {
  return TextStyle(
    color: Theme.of(context).colorScheme.onTertiary,
    fontSize: fSize,
  );
}

TextStyle buttonTextStyle(context) {
  return TextStyle(
    color: Theme.of(context).colorScheme.onTertiary,
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
}