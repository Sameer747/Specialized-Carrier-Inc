import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // ───────────────────────────────────────────────────────────
          // 📍 Left Side (Logo) – Expanded use kiya jaye takay overflow na ho
          // ───────────────────────────────────────────────────────────
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              child: Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 30
                      .w, // screen width ka 30% hi rakh lo takay overflow na ho
                ),
              ),
            ),
          ),

          // ───────────────────────────────────────────────────────────
          // 📍 Vertical Divider
          // ───────────────────────────────────────────────────────────
          Container(
            height: 100.h, // poori screen height
            color: Color(0xfffE0E0E0), // agar divider line aur thin rakhna ho
            width: 0.3.w, // ek patli line ke liye 0.3% width
          ),

          // Agar aap “VerticalDivider” widget use karo to:
          // SizedBox(
          //   height: 100.h,
          //   child: const VerticalDivider(
          //     thickness: 2,
          //     color: Colors.grey,
          //   ),
          // ),

          // ───────────────────────────────────────────────────────────
          // 📍 Right Side (Form) – Expanded karo, and padding % me adjust karo
          // ───────────────────────────────────────────────────────────
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w, // thodi kam padding rakho
                  vertical: 6.h, // vertical padding bhi % me adjust ki
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // “Sign In” header
                    Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 1.h),

                    // Subtitle
                    Text(
                      'Enter your credentials to access your account.',
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    ),
                    SizedBox(height: 3.h),

                    // Email Field
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'dummy@admin.com',
                            border: InputBorder.none,
                            suffixIcon: Icon(
                              Icons.person,
                              color: Colors.amber.shade700,
                              size: 20.sp,
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(fontSize: 12.sp),
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),

                    // Password Field
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: '********',
                            border: InputBorder.none,
                            suffixIcon: Icon(
                              Icons.lock,
                              color: Colors.amber.shade700,
                              size: 20.sp,
                            ),
                          ),
                          obscureText: true,
                          style: TextStyle(fontSize: 12.sp),
                        ),
                      ),
                    ),
                    SizedBox(height: 1.h),

                    // “Forgot your password?” aligned right
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(5.w, 3.h),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          'Forgot your password?',
                          style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(height: 3.h),

                    // Login Button
                    SizedBox(
                      width: double.infinity,
                      height: 6.h,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF0067),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 3.h),

                    // Terms of use / Privacy Policy
                    Center(
                      child: Text(
                        'Terms of use  •  Privacy Policy',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
