import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RoundedTextButton extends StatelessWidget {
  final Color color;
  final String title;
  final String imagePath;
  final bool isSelected;
  final VoidCallback? onTap;

  const RoundedTextButton({
    super.key,
    required this.color,
    required this.imagePath,
    required this.title,
    this.isSelected = false,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 7.h,
      width: 15.w,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected
              ? Color(0xfffFF004D)
              : color, // Background color
          foregroundColor: Colors.white, // Text (and icon) color
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, scale: 1.5),
            SizedBox(width: 0.5.w),
            Text(title, style: TextStyle(fontSize: 12.sp)),
          ],
        ),
      ),
    );
  }
}
