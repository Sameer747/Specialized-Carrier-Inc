// import 'package:flutter/material.dart';

// class UserListScreen extends StatelessWidget {
//   const UserListScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Center(child: Text("UserListScreen")));
//   }
// }

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AllUsersTable extends StatelessWidget {
  const AllUsersTable({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> sampleData = List.generate(5, (index) {
      return {
        "name": "John Doe",
        "email": "johndoe@gmail.com",
        "phone": "95 66 8856",
        "address": "Dummy Street 101",
        "truckId": "100568",
        "image": "images/user.jpg", // Make sure this exists
      };
    });
    return Container(
      height: 70.h,
      width: double.infinity,
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row: Title + Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'All Users',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Wrap(
                  spacing: 0.5.w,
                  children: [
                    _pillButton(
                      "Export",
                      Icons.upload,
                      const Color(0xFFFF004D),
                    ),
                    _pillButton("New", Icons.add, const Color(0xFFFF004D)),
                  ],
                ),
              ],
            ),

            SizedBox(height: 2.h),

            // Table Header
            Padding(
              padding: EdgeInsets.only(bottom: 1.h),
              child: Row(
                children: [
                  Expanded(flex: 1, child: SizedBox()),
                  Expanded(flex: 3, child: _buildHeader('Name')),
                  Expanded(flex: 4, child: _buildHeader('Email')),
                  Expanded(flex: 3, child: _buildHeader('Phone')),
                  Expanded(flex: 4, child: _buildHeader('Address')),
                  Expanded(flex: 2, child: _buildHeader('Truck ID')),
                  Expanded(flex: 2, child: _buildHeader('Image')),
                ],
              ),
            ),
            Divider(thickness: 0.05.h),

            // Table Rows
            ...List.generate(sampleData.length, (index) {
              final item = sampleData[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 0.8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: const Color(0xFFFFB800),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        item['name']!,
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        item['email']!,
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        item['phone']!,
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        item['address']!,
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        item['truckId']!,
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Transform.translate(
                        offset: Offset(-2.w, -1.h),
                        child: CircleAvatar(
                          radius: 2.h,
                          backgroundImage: AssetImage(item['image']!),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),

            SizedBox(height: 2.h),

            // View Full List
            Center(
              child: Column(
                children: [
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black54,
                    size: 30,
                  ),
                  Text(
                    "View Full List",
                    style: TextStyle(
                      color: const Color(0xFFFF004D),
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
        color: const Color(0xFFFFB800),
      ),
    );
  }

  Widget _pillButton(String text, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
              fontSize: 12.sp,
            ),
          ),
          SizedBox(width: 0.2.w),
          Icon(icon, color: color, size: 13.sp),
        ],
      ),
    );
  }
}
