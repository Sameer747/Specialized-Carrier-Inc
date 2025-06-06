import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextFormFieldCustom extends StatelessWidget {
  final String hint;
  final String label;
  const TextFormFieldCustom({
    super.key,
    required this.hint,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 3.w),
          child: Text(
            label,
            style: TextStyle(fontSize: 14.sp, color: Color(0xfffC7AE39)),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 2.w,
          ), //to change the width of  container
          padding: EdgeInsets.symmetric(
            horizontal: 2.w,
          ), //to change the widht inside the container
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextFormField(
            textAlign: TextAlign.start,
            // obscuringCharacter: '*',
            // obscureText: isObscureText,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              isDense: true,
              border: InputBorder.none,
              hintText: hint,
              hintStyle: TextStyle(fontSize: 14.sp, color: Color(0xfffBABABA)),
              // suffixIcon: Icon(suffixIcon, size: 18.sp, color: Color(0xfffC7AE39)),
              contentPadding: EdgeInsets.symmetric(vertical: 2.h),
            ),
          ),
        ),
      ],
    );
  }
}
