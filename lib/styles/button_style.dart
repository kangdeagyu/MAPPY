import 'package:flutter/material.dart';

// 첫 번째 버튼 스타일
ButtonStyle primaryButtonStyle(BuildContext context) {
  return ElevatedButton.styleFrom(
    backgroundColor: Theme.of(context).colorScheme.primary,
    foregroundColor: Theme.of(context).colorScheme.onPrimary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}

ButtonStyle onPrimaryButtonStyle(BuildContext context) {
  return ElevatedButton.styleFrom(
    // minimumSize: const Size(0, 50),
    backgroundColor: Theme.of(context).colorScheme.onPrimary,
    foregroundColor: Theme.of(context).colorScheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}

ButtonStyle secondaryButtonStyle(BuildContext context) {
  return ElevatedButton.styleFrom(
    // minimumSize: const Size(0, 50),
    backgroundColor: Theme.of(context).colorScheme.secondary,
    foregroundColor: Theme.of(context).colorScheme.onSecondary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}

ButtonStyle tertiaryButtonStyle(BuildContext context) {
  return ElevatedButton.styleFrom(
    // minimumSize: const Size(0, 50),
    backgroundColor: Theme.of(context).colorScheme.tertiary,
    foregroundColor: Theme.of(context).colorScheme.onTertiary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}