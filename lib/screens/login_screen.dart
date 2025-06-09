import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:specialized_carrier_inc_admin/screens/home_screen.dart';
import 'package:specialized_carrier_inc_admin/widgets/text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            // left side
            Expanded(
              child: SizedBox(
                // color: Colors.red,
                width: 50.w,
                height: 100.h,
                child: Center(
                  child: Image.asset("assets/images/logo.png", scale: 1.2),
                ),
              ),
            ),
            // divider
            SizedBox(
              height: 100.h,
              child: VerticalDivider(color: Color(0xfffbababa), thickness: 1.2),
            ),
            // right side
            Expanded(
              child: SizedBox(
                // color: Colors.green,
                width: 50.w,
                height: 100.h,
                child: Column(
                  spacing: 3.h,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.8.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 2.h,
                        children: [
                          Text(
                            "Sign In",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Enter your credentials to access your account.",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Color(0xfffBABABA),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // email
                    CustomTextFormField(
                      hint: "dummy@admin.com",
                      suffixIcon: Icons.person,
                      isObscureText: false,
                    ),

                    // password
                    CustomTextFormField(
                      hint: "••••••••••••",
                      suffixIcon: CupertinoIcons.lock,
                      isObscureText: true,
                    ),

                    // forgot your password
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsetsGeometry.directional(end: 3.w),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot your Password?",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Color(0xfffbababa),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 2.w),
                            height: 6.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xfffFF004D),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(0, 20.h),
                          child: Text(
                            "Terms of use. Privacy Policy",
                            style: TextStyle(color: Color(0xfffbababa)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
