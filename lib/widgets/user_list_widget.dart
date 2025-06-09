import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart' hide ScreenType;
import 'package:specialized_carrier_inc_admin/providers/navigation_provider.dart';

class UsersListWidget extends StatelessWidget {
  final double width;
  const UsersListWidget({super.key, required this.width});

  final List<Map<String, String>> sampleData = const [
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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        children: [
          /// Header Row
          Row(
            children: [
              Text(
                'Users List',
                style: TextStyle(
                  fontSize: 13.5.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          _buildTableHeader(),
          Divider(thickness: 0.05.h),

          /// User Rows
          Column(
            children: List.generate(sampleData.take(5).length, (index) {
              final user = sampleData[index];
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.5.h),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: const Color(0xFFFFB800),
                              ),
                            ),
                          ),
                        ),
                        Expanded(flex: 4, child: _buildCapsule(user['name']!)),
                        Expanded(
                          flex: 4,
                          child: _buildCapsule(user['number']!),
                        ),
                        Expanded(
                          flex: 4,
                          child: _buildCapsule(user['truckId']!),
                        ),
                        Expanded(
                          flex: 3,
                          child: CircleAvatar(
                            radius: 2.h,
                            backgroundColor:
                                Colors.grey.shade200, // optional background
                            child: ClipOval(
                              child: Image.asset(
                                user['image']!,
                                fit: BoxFit
                                    .cover, // ensures containment and scaling
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (index != sampleData.take(5).length - 1)
                    Divider(thickness: 0.05.h),
                ],
              );
            }),
          ),

          SizedBox(height: 2.h),
          SizedBox(
            height: 6.h,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Provider.of<NavigationProvider>(
                  context,
                  listen: false,
                ).changeScreen(ScreenType.userList); // Adjust if needed
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF004D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Text(
                'View All Users',
                style: TextStyle(
                  fontSize: 12.sp,
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

  Widget _buildTableHeader() {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.h),
      child: Row(
        children: [
          Expanded(flex: 1, child: _buildHeader('#')),
          Expanded(flex: 4, child: _buildHeader('Name')),
          Expanded(flex: 4, child: _buildHeader('Number')),
          Expanded(flex: 4, child: _buildHeader('Truck ID')),
          Expanded(flex: 3, child: _buildHeader('Image')),
        ],
      ),
    );
  }

  Widget _buildHeader(String title) {
    return Center(
      child: Text(
        title,
        style: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.bold,
          color: const Color(0xFFFC7AE39),
        ),
      ),
    );
  }

  Widget _buildCapsule(String text) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0.5.w),
      padding: EdgeInsets.symmetric(vertical: 0.6.h),
      // decoration: BoxDecoration(
      //   border: Border.all(color: Colors.grey.shade300),
      //   borderRadius: BorderRadius.circular(50),
      // ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 11.5.sp),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
