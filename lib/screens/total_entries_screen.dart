// import 'package:flutter/material.dart';

// class TotalEntriesScreen extends StatelessWidget {
//   const TotalEntriesScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Center(child: Text("TotalEntries")));
//   }
// }

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TotalEntriesScreen extends StatelessWidget {
  const TotalEntriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> entries = [
      {"name": "John Doe", "truckId": "2245", "date": "5/19/25"},
      {"name": "David Warner", "truckId": "2356", "date": "5/19/25"},
      {"name": "M. Jordan", "truckId": "5689", "date": "5/19/25"},
      {"name": "Albert Lee", "truckId": "1856", "date": "5/19/25"},
      {"name": "David Doe", "truckId": "9987", "date": "5/19/25"},
    ];

    return SingleChildScrollView(
      child: Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title + Export Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Entries',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _pillButton("Export", Icons.upload, const Color(0xFFFF004D)),
              ],
            ),

            SizedBox(height: 2.h),

            // Table Header
            Padding(
              padding: EdgeInsets.only(bottom: 1.h),
              child: Row(
                children: [
                  Expanded(flex: 1, child: SizedBox()),
                  Expanded(flex: 4, child: _buildHeader('Driver Name')),
                  Expanded(flex: 3, child: _buildHeader('Truck ID')),
                  Expanded(flex: 3, child: _buildHeader('Date')),
                  Expanded(flex: 3, child: _buildHeader('Action')),
                ],
              ),
            ),
            Divider(thickness: 0.05.h),

            // Table Rows
            ...List.generate(entries.length, (index) {
              final item = entries[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 0.5.h),
                child: Row(
                  children: [
                    // Index
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
                    // Name
                    Expanded(flex: 4, child: _capsuleText(item['name']!)),
                    // Truck ID
                    Expanded(flex: 3, child: _capsuleText(item['truckId']!)),
                    // Date with icon
                    Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          _capsuleText(item['date']!, Icons.date_range),
                          // SizedBox(width: 1.w),
                          // Icon(
                          //   Icons.date_range,
                          //   size: 14.sp,
                          //   color: Colors.grey,
                          // ),
                        ],
                      ),
                    ),
                    // Button
                    Expanded(flex: 3, child: _viewSheetButton()),
                  ],
                ),
              );
            }),

            SizedBox(height: 2.h),

            // View Full Sheet
            Center(
              child: Column(
                children: [
                  const Icon(Icons.keyboard_arrow_down, color: Colors.black54),
                  Text(
                    "View Full Sheet",
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
        children: [
          Text(
            text,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
              fontSize: 12.sp,
            ),
          ),
          SizedBox(width: 0.5.w),
          Icon(icon, color: color, size: 13.sp),
        ],
      ),
    );
  }

  Widget _capsuleText(String text, [IconData? icon]) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 12.sp),
            textAlign: TextAlign.center,
          ),
          SizedBox(width: 1.w),
          Icon(icon),
        ],
      ),
    );
  }

  Widget _viewSheetButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: const Color(0xFFE3E7EF),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(
          'View Sheet',
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
