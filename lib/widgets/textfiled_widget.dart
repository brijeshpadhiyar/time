import 'package:flutter/material.dart';

class CustomeTextWidget extends StatelessWidget {
  final TextEditingController controller;
  final int maxLines;
  final String hintText;
  final String Function(String?)? validator;
  const CustomeTextWidget({
    super.key,
    required this.controller,
    required this.maxLines,
    required this.hintText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(8)),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        validator: validator,
        minLines: 1,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}
