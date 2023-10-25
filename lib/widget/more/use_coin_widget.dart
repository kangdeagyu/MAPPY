import 'package:flutter/material.dart';

Widget useCoin(BuildContext context) {
  return Container(
    width: 180,
    height: 78,
    decoration: ShapeDecoration(
      color: Theme.of(context).colorScheme.onPrimary,
      shape: RoundedRectangleBorder(
        side:
            BorderSide(width: 1, color: Theme.of(context).colorScheme.primary),
      ),
    ),
    child: TextButton.icon(
      onPressed: () {
        //
      },
      icon: Icon(
        Icons.list_alt,
        color: Theme.of(context).colorScheme.primary,
      ),
      label: Text(
        '사용내역',
        style: TextStyle(
            color: Theme.of(context).colorScheme.primary, fontSize: 20),
      ),
      style: TextButton.styleFrom(
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(0.1),
        ),
      ),
    ),
  );
}
