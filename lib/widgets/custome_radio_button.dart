import 'package:flutter/material.dart';

class CustomeRadioWidget extends StatelessWidget {
  final String title;
  final Color categColor;
  final int value;
  const CustomeRadioWidget({
    super.key,
    required this.title,
    required this.categColor,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Theme(
          data: ThemeData(unselectedWidgetColor: Colors.black),
          child: RadioListTile(
            contentPadding: EdgeInsets.zero,
            activeColor: categColor,
            title: Text(
              title,
              style: TextStyle(color: categColor, fontWeight: FontWeight.w700),
            ),
            value: value,
            groupValue: value,
            onChanged: (value) {},
          )),
    );
  }
}
