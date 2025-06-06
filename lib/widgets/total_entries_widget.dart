// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

// class TotalEntriesWidget extends StatelessWidget {
//   const TotalEntriesWidget({super.key});

//   // @override
//   // Widget build(BuildContext context) {
//   //   final List<Map<String, String>> sampleData = [
//   //     {"name": "John", "truckId": "2232", "date": "5/19/25"},
//   //     {"name": "David", "truckId": "4455", "date": "5/19/25"},
//   //     {"name": "Jordon", "truckId": "5678", "date": "5/19/25"},
//   //     {"name": "Albert", "truckId": "7654", "date": "5/19/25"},
//   //   ];
//   //   return Container(
//   //     height: 44.h,
//   //     width: 40.w,
//   //     decoration: BoxDecoration(
//   //       color: Colors.white,
//   //       borderRadius: BorderRadius.circular(16),
//   //     ),
//   //     child: Card(
//   //       child: SingleChildScrollView(
//   //         child: Column(
//   //           children: [
//   //             Padding(
//   //               padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 2.h),
//   //               child: Row(
//   //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //                 children: [
//   //                   Text('Total Entries', style: TextStyle(fontSize: 12.sp)),
//   //                   // month button
//   //                   Container(
//   //                     height: 5.h,
//   //                     width: 7.w,
//   //                     decoration: BoxDecoration(
//   //                       color: Colors.pink.withOpacity(0.2),
//   //                       borderRadius: BorderRadius.circular(16),
//   //                     ),
//   //                     child: Row(
//   //                       mainAxisAlignment: MainAxisAlignment.center,
//   //                       children: [
//   //                         Text('Month'),
//   //                         Icon(Icons.keyboard_arrow_down),
//   //                       ],
//   //                     ),
//   //                   ),
//   //                   CustomTable(data: sampleData),
//   //                 ],
//   //               ),
//   //             ),
//   //           ],
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }
//   @override
//   Widget build(BuildContext context) {
//     final List<Map<String, String>> sampleData = [
//       {"name": "John", "truckId": "2232", "date": "5/19/25"},
//       {"name": "David", "truckId": "4455", "date": "5/19/25"},
//       {"name": "Jordon", "truckId": "5678", "date": "5/19/25"},
//       {"name": "Albert", "truckId": "7654", "date": "5/19/25"},
//     ];

//     return Container(
//       height: 60.h,
//       width: 44.w,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Card(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Header Row
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Total Entries',
//                     style: TextStyle(
//                       fontSize: 12.sp,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   // Month Button
//                   Container(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 3.w,
//                       vertical: 0.8.h,
//                     ),
//                     decoration: BoxDecoration(
//                       color: Colors.pink.withOpacity(0.2),
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child: Row(
//                       children: [
//                         Text(
//                           'Month',
//                           style: TextStyle(color: Colors.pink, fontSize: 10.sp),
//                         ),
//                         const Icon(
//                           Icons.keyboard_arrow_down,
//                           color: Colors.pink,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),

//               SizedBox(height: 2.h),

//               // ✅ Properly Placed Table Below
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: CustomTable(data: sampleData),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CustomTable extends StatelessWidget {
//   final List<Map<String, String>> data;

//   const CustomTable({super.key, required this.data});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(3.w),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Header Row
//           Row(
//             children: [
//               Expanded(flex: 1, child: SizedBox()), // for index
//               Expanded(flex: 3, child: _buildHeader('Name')),
//               Expanded(flex: 3, child: _buildHeader('Truck ID')),
//               Expanded(flex: 3, child: _buildHeader('Date')),
//               Expanded(flex: 3, child: _buildHeader('Action')),
//             ],
//           ),
//           Divider(thickness: 0.1.h),

//           // Data Rows
//           ...List.generate(data.length, (index) {
//             final item = data[index];
//             return Padding(
//               padding: EdgeInsets.symmetric(vertical: 1.2.h),
//               child: Row(
//                 children: [
//                   // Index
//                   Expanded(
//                     flex: 1,
//                     child: Text(
//                       '${index + 1}',
//                       style: TextStyle(
//                         fontSize: 10.sp,
//                         fontWeight: FontWeight.w500,
//                         color: const Color(0xFFFFB800), // Yellow
//                       ),
//                     ),
//                   ),
//                   // Name
//                   Expanded(flex: 3, child: _buildCapsule(item['name']!)),
//                   // Truck ID
//                   Expanded(flex: 3, child: _buildCapsule(item['truckId']!)),
//                   // Date
//                   Expanded(flex: 3, child: _buildCapsule(item['date']!)),
//                   // Action Button
//                   Expanded(flex: 3, child: _buildButton()),
//                 ],
//               ),
//             );
//           }),
//         ],
//       ),
//     );
//   }

//   Widget _buildHeader(String title) {
//     return Text(
//       title,
//       style: TextStyle(
//         fontSize: 11.sp,
//         fontWeight: FontWeight.bold,
//         color: const Color(0xFFFFB800), // Yellowish header
//       ),
//     );
//   }

//   Widget _buildCapsule(String text) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey.shade300),
//         borderRadius: BorderRadius.circular(50),
//       ),
//       child: Text(
//         text,
//         style: TextStyle(fontSize: 10.sp),
//         textAlign: TextAlign.center,
//       ),
//     );
//   }

//   Widget _buildButton() {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
//       decoration: BoxDecoration(
//         color: const Color(0xFFE3E7EF),
//         borderRadius: BorderRadius.circular(50),
//       ),
//       child: Center(
//         child: Text(
//           'View Sheet',
//           style: TextStyle(
//             fontSize: 10.sp,
//             fontWeight: FontWeight.w500,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// class TotalEntriesWidget extends StatelessWidget {
//   const TotalEntriesWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<Map<String, String>> sampleData = [
//       {"name": "John", "truckId": "2232", "date": "5/19/25"},
//       {"name": "David", "truckId": "4455", "date": "5/19/25"},
//       {"name": "Jordon", "truckId": "5678", "date": "5/19/25"},
//       {"name": "Albert", "truckId": "7654", "date": "5/19/25"},
//     ];

//     return Container(
//       width: 44.w,
//       padding: EdgeInsets.all(3.w),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(4.w),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Header Row
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Total Entries',
//                 style: TextStyle(
//                   fontSize: 13.sp,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0.8.h),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFFFF1F5),
//                   borderRadius: BorderRadius.circular(20.w),
//                 ),
//                 child: Row(
//                   children: [
//                     Text(
//                       'Month',
//                       style: TextStyle(
//                         color: const Color(0xFFFF004D),
//                         fontWeight: FontWeight.w600,
//                         fontSize: 10.sp,
//                       ),
//                     ),
//                     const Icon(
//                       Icons.keyboard_arrow_down,
//                       color: Color(0xFFFF004D),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 2.h),

//           // Table Header
//           Row(
//             children: [
//               Expanded(flex: 1, child: SizedBox()),
//               Expanded(flex: 3, child: _buildHeader('Name')),
//               Expanded(flex: 3, child: _buildHeader('Truck ID')),
//               Expanded(flex: 3, child: _buildHeader('Date')),
//               Expanded(flex: 3, child: _buildHeader('Action')),
//             ],
//           ),
//           Divider(thickness: 0.05.h),

//           // Table Rows
//           ...List.generate(sampleData.length, (index) {
//             final item = sampleData[index];
//             return Padding(
//               padding: EdgeInsets.symmetric(vertical: 0.8.h),
//               child: Row(
//                 children: [
//                   // Index
//                   Expanded(
//                     flex: 1,
//                     child: Text(
//                       '${index + 1}',
//                       style: TextStyle(
//                         fontSize: 10.sp,
//                         fontWeight: FontWeight.w500,
//                         color: const Color(0xFFFFB800),
//                       ),
//                     ),
//                   ),
//                   // Name
//                   Expanded(flex: 3, child: _buildCapsule(item['name']!)),
//                   // Truck ID
//                   Expanded(flex: 3, child: _buildCapsule(item['truckId']!)),
//                   // Date
//                   Expanded(flex: 3, child: _buildCapsule(item['date']!)),
//                   // Button
//                   Expanded(flex: 3, child: _buildButton()),
//                 ],
//               ),
//             );
//           }),

//           SizedBox(height: 1.h),
//           Divider(thickness: 0.05.h),
//           SizedBox(height: 1.5.h),

//           // View All Button
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFFFF004D),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(50),
//                 ),
//                 padding: EdgeInsets.symmetric(vertical: 1.8.h),
//               ),
//               onPressed: () {},
//               child: Text(
//                 'View All Entries',
//                 style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildHeader(String text) {
//     return Text(
//       text,
//       style: TextStyle(
//         fontSize: 10.sp,
//         fontWeight: FontWeight.bold,
//         color: const Color(0xFFFFB800),
//       ),
//     );
//   }

//   Widget _buildCapsule(String text) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey.shade300),
//         borderRadius: BorderRadius.circular(50),
//       ),
//       child: Center(
//         child: Text(text, style: TextStyle(fontSize: 9.sp)),
//       ),
//     );
//   }

//   Widget _buildButton() {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
//       decoration: BoxDecoration(
//         color: const Color(0xFFE3E7EF),
//         borderRadius: BorderRadius.circular(50),
//       ),
//       child: Center(
//         child: Text(
//           'View Sheet',
//           style: TextStyle(
//             fontSize: 9.sp,
//             fontWeight: FontWeight.w500,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }
// }

class TotalEntriesWidget extends StatelessWidget {
  const TotalEntriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> sampleData = [
      {"name": "John", "truckId": "2232", "date": "5/19/25"},
      {"name": "David", "truckId": "4455", "date": "5/19/25"},
      {"name": "Jordon", "truckId": "5678", "date": "5/19/25"},
      {"name": "Albert", "truckId": "7654", "date": "5/19/25"},
    ];

    return Container(
      // height: 50.h,
      width: 35.w,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3.w),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Entries',
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0.8.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF1F5),
                  borderRadius: BorderRadius.circular(20.w),
                ),
                child: Row(
                  children: [
                    Text(
                      'Month',
                      style: TextStyle(
                        color: const Color(0xFFFF004D),
                        fontWeight: FontWeight.bold,
                        fontSize: 10.sp,
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xFFFF004D),
                    ),
                  ],
                ),
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
                Expanded(flex: 3, child: _buildHeader('Truck ID')),
                Expanded(flex: 3, child: _buildHeader('Date')),
                Expanded(flex: 3, child: _buildHeader('Action')),
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
                  // Index
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
                  Expanded(flex: 3, child: _buildCapsule(item['name']!)),
                  Expanded(flex: 3, child: _buildCapsule(item['truckId']!)),
                  Expanded(flex: 3, child: _buildCapsule(item['date']!)),
                  Expanded(flex: 3, child: _buildButton()),
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
                'View All Entries',
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
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
        color: const Color(0xFFFC7AE39),
      ),
    );
  }

  Widget _buildCapsule(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(text, style: TextStyle(fontSize: 9.sp)),
      ),
    );
  }

  Widget _buildButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: const Color(0xFFE3E7EF),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(
          'View Sheet',
          style: TextStyle(
            fontSize: 9.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
