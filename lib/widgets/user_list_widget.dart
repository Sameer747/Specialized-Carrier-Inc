import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UsersListWidget extends StatelessWidget {
  const UsersListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> sampleData = [
      {
        "name": "John Doe",
        "number": "95 66 8856",
        "truckId": "100568",
        "image":
            "assets/images/user.jpg", // Make sure this image exists in assets
      },
      {
        "name": "John Doe",
        "number": "95 66 8856",
        "truckId": "100568",
        "image": "assets/images/user.jpg",
      },
      {
        "name": "John Doe",
        "number": "95 66 8856",
        "truckId": "100568",
        "image": "assets/images/user.jpg",
      },
      {
        "name": "John Doe",
        "number": "95 66 8856",
        "truckId": "100568",
        "image": "assets/images/user.jpg",
      },
    ];

    return Container(
      // height: 50.h,
      width: 35.w,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Title
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Users List',
              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
            ),
          ),

          SizedBox(height: 2.h),

          // Table Header
          Padding(
            padding: EdgeInsets.only(bottom: 1.h),
            child: Row(
              children: [
                Expanded(flex: 1, child: SizedBox()),
                Expanded(flex: 3, child: _buildHeader('Name')),
                Expanded(flex: 3, child: _buildHeader('Number')),
                Expanded(flex: 3, child: _buildHeader('Truck ID')),
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
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: const Color(0xFFFFB800),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      item['name']!,
                      style: TextStyle(fontSize: 9.sp),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      item['number']!,
                      style: TextStyle(fontSize: 9.sp),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      item['truckId']!,
                      style: TextStyle(fontSize: 9.sp),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: CircleAvatar(
                      radius: 3.h,
                      backgroundImage: AssetImage(item['image']!),
                    ),
                  ),
                ],
              ),
            );
          }),

          SizedBox(height: 2.h),

          // Bottom Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF004D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: EdgeInsets.symmetric(vertical: 1.6.h),
              ),
              child: Text(
                'View All Users',
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 11.sp,
        fontWeight: FontWeight.bold,
        color: const Color(0xFFFFB800),
      ),
    );
  }
}
