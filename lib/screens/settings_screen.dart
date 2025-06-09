import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),

          // padding: EdgeInsets.all(3.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(3.w),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  "Admin Details",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 1.h),

                // Yellow Subheading
                Text(
                  "User Info:",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFFFB800),
                  ),
                ),
                Divider(),
                SizedBox(height: 2.h),

                // Row: Info + Image
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Info Column
                    Expanded(
                      flex: 6,
                      child: Column(
                        children: [
                          _infoRow(
                            Icons.person,
                            "Name:",
                            "John Doe",
                            bold: true,
                          ),
                          _infoRow(Icons.badge, "ID#", "458799"),
                          _infoRow(Icons.phone, "Number#", "(0) 955 55 765"),
                          _infoRow(
                            Icons.email_outlined,
                            "Email ID:",
                            "johndoe@gmail.com",
                            bold: true,
                          ),
                          _infoRow(Icons.lock, "Password", "●●●●●●●"),
                        ],
                      ),
                    ),
                    SizedBox(width: 5.w),

                    // Profile Image
                    Expanded(
                      flex: 4,
                      child: Transform.translate(
                        offset: Offset(0, -5.h),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            3.w,
                          ), // responsive corner
                          child: AspectRatio(
                            aspectRatio: 1, // optional: square image
                            child: Image.asset(
                              "assets/images/user.jpg",
                              fit: BoxFit
                                  .cover, // important for borderRadius to apply
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoRow(
    IconData icon,
    String label,
    String value, {
    bool bold = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.9.h),
      child: Row(
        children: [
          Icon(icon, color: Colors.pink, size: 14.sp),
          SizedBox(width: 1.w),
          Text(
            label,
            style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade700),
          ),
          SizedBox(width: 1.w),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: bold ? FontWeight.bold : FontWeight.w500,
                color: Colors.black,
              ),
              // overflow: TextOverflow.ellipsis,
            ),
          ),
          Icon(Icons.edit, size: 14.sp, color: Colors.grey.shade400),
        ],
      ),
    );
  }
}
