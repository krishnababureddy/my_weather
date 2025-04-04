import 'package:flutter/material.dart';
import '/constants/app_colors.dart';

class RoundTextField extends StatelessWidget {
  const RoundTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.hintText = 'Search',
  });

  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: AppColors.accentBlue,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        style: const TextStyle(
          color: AppColors.white,
        ),
        controller: controller,
        onChanged: onChanged, // Trigger search on text change
        decoration: InputDecoration(
          fillColor: Colors.white,
          focusColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.grey,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: AppColors.grey,
            fontWeight: FontWeight.w400,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
