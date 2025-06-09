import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../providers/view_toggle_provider.dart'; // adjust the path accordingly

class AllUsersScreen extends StatelessWidget {
  const AllUsersScreen({super.key});

  final List<Map<String, String>> users = const [
    {
      "name": "John Doe",
      "email": "johndoe@gmail.com",
      "phone": "95 66 8856",
      "address": "Dummy Street 101",
      "truckId": "100568",
      "image": "assets/images/user.jpg",
    },
    {
      "name": "John Doe",
      "email": "johndoe@gmail.com",
      "phone": "95 66 8856",
      "address": "Dummy Street 101",
      "truckId": "100568",
      "image": "assets/images/user.jpg",
    },
    {
      "name": "John Doe",
      "email": "johndoe@gmail.com",
      "phone": "95 66 8856",
      "address": "Dummy Street 101",
      "truckId": "100568",
      "image": "assets/images/user.jpg",
    },
    {
      "name": "John Doe",
      "email": "johndoe@gmail.com",
      "phone": "95 66 8856",
      "address": "Dummy Street 101",
      "truckId": "100568",
      "image": "assets/images/user.jpg",
    },
    {
      "name": "John Doe",
      "email": "johndoe@gmail.com",
      "phone": "95 66 8856",
      "address": "Dummy Street 101",
      "truckId": "100568",
      "image": "assets/images/user.jpg",
    },
    {
      "name": "John Doe",
      "email": "johndoe@gmail.com",
      "phone": "95 66 8856",
      "address": "Dummy Street 101",
      "truckId": "100568",
      "image": "assets/images/user.jpg",
    },
    {
      "name": "John Doe",
      "email": "johndoe@gmail.com",
      "phone": "95 66 8856",
      "address": "Dummy Street 101",
      "truckId": "100568",
      "image": "assets/images/user.jpg",
    },
    // repeat as needed...
  ];

  @override
  Widget build(BuildContext context) {
    final toggleProvider = Provider.of<ViewToggleProvider>(context);
    final visibleUsers = toggleProvider.viewAll
        ? users
        : users.take(5).toList();

    return SingleChildScrollView(
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 0, vertical: 2.h),
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 4,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Top Header Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All Users',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      _pillButton(
                        "Export",
                        Icons.file_upload_outlined,
                        const Color(0xFFFF004D),
                      ),
                      SizedBox(width: 0.5.w),
                      _pillButton("New", Icons.add, const Color(0xFFFF004D)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 2.h),

              /// Table Header
              _buildTableHeader(),
              Divider(thickness: 0.05.h),

              /// Table Rows
              ...List.generate(visibleUsers.length, (index) {
                final user = visibleUsers[index];
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 0.8.h),
                      child: Row(
                        children: [
                          _dataCell('${index + 1}', flex: 1, alignCenter: true),
                          _dataCell(user['name']!, flex: 3),
                          _dataCell(user['email']!, flex: 4),
                          _dataCell(user['phone']!, flex: 3),
                          _dataCell(user['address']!, flex: 4),
                          _dataCell(user['truckId']!, flex: 2),
                          Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.center,
                              child: CircleAvatar(
                                radius: 2.5.h,
                                backgroundColor: Colors.grey.shade200,
                                child: ClipOval(
                                  child: Image.asset(
                                    user['image']!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (index != visibleUsers.length - 1)
                      Divider(thickness: 0.05.h),
                  ],
                );
              }),

              SizedBox(height: 2.h),

              /// Toggle Button
              Center(
                child: GestureDetector(
                  onTap: toggleProvider.toggleView,
                  child: Column(
                    children: [
                      Icon(
                        toggleProvider.viewAll
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Colors.black54,
                      ),
                      Text(
                        toggleProvider.viewAll ? "Show Less" : "View Full List",
                        style: TextStyle(
                          color: const Color(0xFFFF004D),
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTableHeader() {
    return Row(
      children: [
        _headerCell("#", flex: 1, alignCenter: true),
        _headerCell("Name", flex: 3),
        _headerCell("Email", flex: 4),
        _headerCell("Phone", flex: 3),
        _headerCell("Address", flex: 4),
        _headerCell("Truck ID", flex: 2),
        _headerCell("Image", flex: 2, alignCenter: true),
      ],
    );
  }

  Widget _headerCell(
    String title, {
    required int flex,
    bool alignCenter = false,
  }) {
    return Expanded(
      flex: flex,
      child: Align(
        alignment: alignCenter ? Alignment.center : Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12.sp,
            color: const Color(0xFFFC7AE39),
          ),
        ),
      ),
    );
  }

  Widget _dataCell(String text, {required int flex, bool alignCenter = false}) {
    return Expanded(
      flex: flex,
      child: Align(
        alignment: alignCenter ? Alignment.center : Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(fontSize: 12.sp),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
    );
  }

  Widget _pillButton(String text, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 12.sp,
              // fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 0.3.w),
          Transform.translate(
            offset: Offset(0, 0.3.h),
            child: Icon(icon, color: color, size: 12.sp),
          ),
        ],
      ),
    );
  }
}
