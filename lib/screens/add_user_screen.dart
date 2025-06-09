import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:specialized_carrier_inc_admin/widgets/custom_text_form_field.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Card(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 2.h),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                // header
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Add Users",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 5.h,
                        width: 8.w,
                        decoration: BoxDecoration(
                          color: Colors.pink.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextButton(
                          onPressed: () {
                            print('sds');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "New",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.pink,
                                ),
                              ),
                              Icon(Icons.add, color: Colors.pink),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                // form
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 2.h,
                    children: [
                      // name & email
                      Row(
                        children: [
                          // name
                          Expanded(
                            child: SizedBox(
                              width: 35.w,
                              child: TextFormFieldCustom(
                                hint: 'Enter Your Name',
                                label: "Name",
                              ),
                            ),
                          ),
                          // email
                          Expanded(
                            child: SizedBox(
                              width: 35.w,
                              child: TextFormFieldCustom(
                                hint: 'Enter Your Email',
                                label: "Email",
                              ),
                            ),
                          ),
                        ],
                      ),
                      // phone no & truck id
                      Row(
                        children: [
                          // phoneno
                          Expanded(
                            child: SizedBox(
                              width: 35.w,
                              child: TextFormFieldCustom(
                                hint: 'Enter Your Number',
                                label: "Phone#",
                              ),
                            ),
                          ),
                          // phoneno
                          Expanded(
                            child: SizedBox(
                              width: 35.w,
                              child: TextFormFieldCustom(
                                hint: 'Enter Your ID',
                                label: "Truck ID",
                              ),
                            ),
                          ),
                        ],
                      ),
                      // address
                      SizedBox(
                        width: double.infinity,
                        child: TextFormFieldCustom(
                          hint: 'Enter Your Number',
                          label: "Address",
                        ),
                      ),
                      // upload file
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.4.w),
                        child: Row(
                          children: [
                            Text(
                              'Upload your picture here...',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Color(0xfffBFBFBF),
                              ),
                            ),
                            SizedBox(width: 1.w),
                            Icon(
                              Icons.file_upload_outlined,
                              color: Color(0xfffFF004D),
                            ),
                          ],
                        ),
                      ),
                      // save button
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),

                          height: 6.h,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                // Color(0xfffDFE5EF),
                                Color(0xFFFF004D),
                              ),
                            ),
                            child: Text(
                              'Save',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
