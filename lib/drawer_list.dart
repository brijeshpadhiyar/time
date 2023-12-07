import 'package:flutter/material.dart';

Widget customeListTile(
  String title,
  VoidCallback onTap,
) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: ListTile(
      onTap: onTap,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      tileColor: Colors.white,
      title: Text(title),
      trailing: const Icon(
        Icons.keyboard_arrow_right_outlined,
        color: Colors.black,
        size: 30,
      ),
    ),
  );
}
