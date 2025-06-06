import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextButton extends StatelessWidget {
  final Color color;
  final String title;
  final String imagePath;
  final bool isSelected;
  final VoidCallback? onTap;

  const CustomTextButton({
    super.key,
    required this.color,
    required this.imagePath,
    required this.title,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity, // Full width in sidebar
        padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.w),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              scale: 1.5,
              color: isSelected ? const Color(0xffFF004D) : color,
            ),
            SizedBox(width: 0.5.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? const Color(0xffFF004D) : color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
