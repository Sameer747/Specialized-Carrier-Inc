// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

// class TotalEntriesScreen extends StatefulWidget {
//   const TotalEntriesScreen({super.key});

//   @override
//   State<TotalEntriesScreen> createState() => _TotalEntriesScreenState();
// }

// class _TotalEntriesScreenState extends State<TotalEntriesScreen> {
//   bool _viewAll = false;

//   final List<Map<String, String>> entries = [
//     {"name": "John Doe", "truckId": "2245", "date": "5/19/25"},
//     {"name": "David Warner", "truckId": "2356", "date": "5/19/25"},
//     {"name": "M. Jordan", "truckId": "5689", "date": "5/19/25"},
//     {"name": "Albert Lee", "truckId": "1856", "date": "5/19/25"},
//     {"name": "David Doe", "truckId": "9987", "date": "5/19/25"},
//     {"name": "John Doe", "truckId": "6543", "date": "5/19/25"},
//     {"name": "John Doe", "truckId": "7890", "date": "5/19/25"},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final double nameWidth = 30.w;
//     final double truckIdWidth = 20.w;
//     final double dateWidth = 25.w;

//     final List<Map<String, String>> visibleEntries = _viewAll
//         ? entries
//         : entries.take(5).toList();

//     return SingleChildScrollView(
//       child: Card(
//         color: Colors.white,
//         margin: EdgeInsets.symmetric(horizontal: 0.5.w, vertical: 2.h),
//         elevation: 4,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Title + Export Button
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Total Entries',
//                     style: TextStyle(
//                       fontSize: 16.sp,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   _pillButton(
//                     "Export",
//                     Icons.file_upload_outlined,
//                     const Color(0xFFFF004D),
//                   ),
//                 ],
//               ),

//               SizedBox(height: 2.h),

//               // Table Header
//               Padding(
//                 padding: EdgeInsets.only(bottom: 1.h),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       flex: 1,
//                       child: Center(child: Text("#", style: _headerStyle())),
//                     ),
//                     Expanded(flex: 4, child: _buildHeader('Driver Name')),
//                     Expanded(flex: 3, child: _buildHeader('Truck ID')),
//                     Expanded(flex: 3, child: _buildHeader('Date')),
//                     Expanded(flex: 3, child: _buildHeader('Action')),
//                   ],
//                 ),
//               ),
//               Divider(thickness: 0.05.h),

//               // Table Rows
//               ...List.generate(visibleEntries.length, (index) {
//                 final item = visibleEntries[index];
//                 return Column(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(vertical: 0.8.h),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Expanded(
//                             flex: 1,
//                             child: Center(
//                               child: Text(
//                                 '${index + 1}',
//                                 style: TextStyle(
//                                   fontSize: 14.sp,
//                                   color: const Color(0xFFFFB800),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             flex: 4,
//                             child: Align(
//                               alignment: Alignment.centerLeft,
//                               child: _capsuleText(item['name']!, nameWidth),
//                             ),
//                           ),
//                           Expanded(
//                             flex: 3,
//                             child: Align(
//                               alignment: Alignment.centerLeft,
//                               child: _capsuleText(
//                                 item['truckId']!,
//                                 truckIdWidth,
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             flex: 3,
//                             child: Align(
//                               alignment: Alignment.centerLeft,
//                               child: _capsuleText(
//                                 item['date']!,
//                                 dateWidth,
//                                 icon: Icons.date_range,
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             flex: 3,
//                             child: Align(child: _viewSheetButton()),
//                           ),
//                         ],
//                       ),
//                     ),
//                     if (index != visibleEntries.length - 1)
//                       Divider(thickness: 0.05.h),
//                   ],
//                 );
//               }),

//               SizedBox(height: 2.h),

//               // View Full Sheet Button
//               Center(
//                 child: GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       _viewAll = !_viewAll;
//                     });
//                   },
//                   child: Column(
//                     children: [
//                       Icon(
//                         _viewAll
//                             ? Icons.keyboard_arrow_up
//                             : Icons.keyboard_arrow_down,
//                         color: Colors.black54,
//                       ),
//                       Text(
//                         _viewAll ? "Show Less" : "View Full Sheet",
//                         style: TextStyle(
//                           color: const Color(0xFFFF004D),
//                           fontWeight: FontWeight.w500,
//                           fontSize: 12.sp,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   TextStyle _headerStyle() {
//     return TextStyle(
//       fontSize: 13.sp,
//       fontWeight: FontWeight.bold,
//       color: const Color(0xFFFFB800),
//     );
//   }

//   Widget _buildHeader(String title) {
//     return Center(child: Text(title, style: _headerStyle()));
//   }

//   Widget _pillButton(String text, IconData icon, Color color) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
//       decoration: BoxDecoration(
//         color: color.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(30),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             text,
//             style: TextStyle(
//               color: color,
//               // fontWeight: FontWeight.w600,
//               fontSize: 12.sp,
//             ),
//           ),
//           SizedBox(width: 0.3.w),
//           Icon(icon, color: color, size: 13.sp),
//         ],
//       ),
//     );
//   }

//   Widget _capsuleText(String text, double width, {IconData? icon}) {
//     return SizedBox(
//       width: width,
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey.shade300),
//           borderRadius: BorderRadius.circular(50),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Flexible(
//               child: Text(
//                 text,
//                 style: TextStyle(fontSize: 11.sp),
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 1,
//               ),
//             ),
//             if (icon != null) ...[
//               SizedBox(width: 1.w),
//               Icon(icon, size: 13.sp, color: Colors.grey),
//             ],
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _viewSheetButton() {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
//       decoration: BoxDecoration(
//         color: const Color(0xFFE3E7EF),
//         borderRadius: BorderRadius.circular(50),
//       ),
//       child: Text(
//         'View Sheet',
//         style: TextStyle(
//           fontSize: 12.sp,
//           fontWeight: FontWeight.w500,
//           color: Colors.black87,
//         ),
//       ),
//     );
//   }
// }

// code with export as excel

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:excel/excel.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:sizer/sizer.dart';

// class TotalEntriesScreen extends StatefulWidget {
//   const TotalEntriesScreen({super.key});

//   @override
//   State<TotalEntriesScreen> createState() => _TotalEntriesScreenState();
// }

// class _TotalEntriesScreenState extends State<TotalEntriesScreen> {
//   bool _viewAll = false;

//   final List<Map<String, String>> entries = [
//     {"name": "John Doe", "truckId": "2245", "date": "5/19/25"},
//     {"name": "David Warner", "truckId": "2356", "date": "5/19/25"},
//     {"name": "M. Jordan", "truckId": "5689", "date": "5/19/25"},
//     {"name": "Albert Lee", "truckId": "1856", "date": "5/19/25"},
//     {"name": "David Doe", "truckId": "9987", "date": "5/19/25"},
//     {"name": "Chris Evans", "truckId": "6543", "date": "5/19/25"},
//     {"name": "Natalie Portman", "truckId": "7890", "date": "5/19/25"},
//   ];

//   Future<void> _exportToExcel() async {
//     final excel = Excel.createExcel();
//     final sheet = excel['Total Entries'];

//     sheet.appendRow([
//       TextCellValue('#'),
//       TextCellValue('Driver Name'),
//       TextCellValue('Truck ID'),
//       TextCellValue('Date'),
//     ]);

//     for (int i = 0; i < entries.length; i++) {
//       final item = entries[i];
//       sheet.appendRow([
//         TextCellValue((i + 1).toString()),
//         TextCellValue(item['name'] ?? ''),
//         TextCellValue(item['truckId'] ?? ''),
//         TextCellValue(item['date'] ?? ''),
//       ]);
//     }

//     if (await Permission.storage.request().isGranted) {
//       final dir = await getApplicationDocumentsDirectory();
//       final filePath = "${dir.path}/total_entries.xlsx";
//       final file = File(filePath);
//       await file.writeAsBytes(excel.encode()!);

//       if (context.mounted) {
//         ScaffoldMessenger.of(
//           context,
//         ).showSnackBar(SnackBar(content: Text('Excel exported to: $filePath')));
//       }
//     } else {
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Storage permission denied')),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double nameWidth = 30.w;
//     final double truckIdWidth = 20.w;
//     final double dateWidth = 25.w;

//     final visibleEntries = _viewAll ? entries : entries.take(5).toList();

//     return SingleChildScrollView(
//       child: Card(
//         margin: EdgeInsets.symmetric(horizontal: 0.5.w, vertical: 2.h),
//         elevation: 4,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
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
//                       fontSize: 16.sp,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   _pillButton(
//                     "Export",
//                     Icons.file_upload_outlined,
//                     const Color(0xFFFF004D),
//                     onTap: _exportToExcel,
//                   ),
//                 ],
//               ),
//               SizedBox(height: 2.h),

//               // Table Header
//               Padding(
//                 padding: EdgeInsets.only(bottom: 1.h),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       flex: 1,
//                       child: Center(child: Text("#", style: _headerStyle())),
//                     ),
//                     Expanded(flex: 4, child: _buildHeader('Driver Name')),
//                     Expanded(flex: 3, child: _buildHeader('Truck ID')),
//                     Expanded(flex: 3, child: _buildHeader('Date')),
//                     Expanded(flex: 3, child: _buildHeader('Action')),
//                   ],
//                 ),
//               ),
//               Divider(thickness: 0.05.h),

//               // Table Rows
//               ...List.generate(visibleEntries.length, (index) {
//                 final item = visibleEntries[index];
//                 return Column(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(vertical: 0.8.h),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             flex: 1,
//                             child: Center(
//                               child: Text(
//                                 '${index + 1}',
//                                 style: TextStyle(
//                                   fontSize: 14.sp,
//                                   color: const Color(0xFFFFB800),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             flex: 4,
//                             child: _capsuleText(item['name']!, nameWidth),
//                           ),
//                           Expanded(
//                             flex: 3,
//                             child: _capsuleText(item['truckId']!, truckIdWidth),
//                           ),
//                           Expanded(
//                             flex: 3,
//                             child: _capsuleText(
//                               item['date']!,
//                               dateWidth,
//                               icon: Icons.date_range,
//                             ),
//                           ),
//                           Expanded(flex: 3, child: _viewSheetButton()),
//                         ],
//                       ),
//                     ),
//                     if (index != visibleEntries.length - 1)
//                       Divider(thickness: 0.05.h),
//                   ],
//                 );
//               }),

//               SizedBox(height: 2.h),

//               // Toggle View
//               Center(
//                 child: GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       _viewAll = !_viewAll;
//                     });
//                   },
//                   child: Column(
//                     children: [
//                       Icon(
//                         _viewAll
//                             ? Icons.keyboard_arrow_up
//                             : Icons.keyboard_arrow_down,
//                         color: Colors.black54,
//                       ),
//                       Text(
//                         _viewAll ? "Show Less" : "View Full Sheet",
//                         style: TextStyle(
//                           color: const Color(0xFFFF004D),
//                           fontWeight: FontWeight.w500,
//                           fontSize: 12.sp,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   TextStyle _headerStyle() {
//     return TextStyle(
//       fontSize: 13.sp,
//       fontWeight: FontWeight.bold,
//       color: const Color(0xFFFFB800),
//     );
//   }

//   Widget _buildHeader(String title) {
//     return Center(child: Text(title, style: _headerStyle()));
//   }

//   Widget _pillButton(
//     String text,
//     IconData icon,
//     Color color, {
//     VoidCallback? onTap,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
//         decoration: BoxDecoration(
//           color: color.withOpacity(0.1),
//           borderRadius: BorderRadius.circular(30),
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               text,
//               style: TextStyle(color: color, fontSize: 12.sp),
//             ),
//             SizedBox(width: 0.5.w),
//             Icon(icon, color: color, size: 13.sp),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _capsuleText(String text, double width, {IconData? icon}) {
//     return SizedBox(
//       width: width,
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
//         decoration: BoxDecoration(
//           // border: Border.all(color: Colors.grey.shade300),
//           borderRadius: BorderRadius.circular(50),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Flexible(
//               child: Text(
//                 text,
//                 style: TextStyle(fontSize: 11.sp),
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 1,
//               ),
//             ),
//             if (icon != null) ...[
//               SizedBox(width: 1.w),
//               Icon(icon, size: 13.sp, color: Colors.grey),
//             ],
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _viewSheetButton() {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
//       decoration: BoxDecoration(
//         color: const Color(0xFFE3E7EF),
//         borderRadius: BorderRadius.circular(50),
//       ),
//       child: Text(
//         'View Sheet',
//         style: TextStyle(
//           fontSize: 12.sp,
//           fontWeight: FontWeight.w500,
//           color: Colors.black87,
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../providers/view_toggle_provider.dart'; // Adjust path

class TotalEntriesScreen extends StatelessWidget {
  const TotalEntriesScreen({super.key});

  final List<Map<String, String>> entries = const [
    {"name": "John Doe", "truckId": "2245", "date": "5/19/25"},
    {"name": "David Warner", "truckId": "2356", "date": "5/19/25"},
    {"name": "M. Jordan", "truckId": "5689", "date": "5/19/25"},
    {"name": "Albert Lee", "truckId": "1856", "date": "5/19/25"},
    {"name": "David Doe", "truckId": "9987", "date": "5/19/25"},
    {"name": "John Doe", "truckId": "6543", "date": "5/19/25"},
    {"name": "John Doe", "truckId": "7890", "date": "5/19/25"},
  ];

  @override
  Widget build(BuildContext context) {
    final viewAll = context.watch<ViewToggleProvider>().viewAll;
    final visibleEntries = viewAll ? entries : entries.take(5).toList();

    final nameWidth = 30.w;
    final truckIdWidth = 20.w;
    final dateWidth = 25.w;

    return SingleChildScrollView(
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(horizontal: 0.5.w, vertical: 2.h),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title & Export Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Entries',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  _pillButton(
                    "Export",
                    Icons.file_upload_outlined,
                    const Color(0xFFFF004D),
                  ),
                ],
              ),

              SizedBox(height: 2.h),

              /// Table Header
              Padding(
                padding: EdgeInsets.only(bottom: 1.h),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Center(child: Text("#", style: _headerStyle())),
                    ),
                    Expanded(flex: 4, child: _buildHeader('Driver Name')),
                    Expanded(flex: 3, child: _buildHeader('Truck ID')),
                    Expanded(flex: 3, child: _buildHeader('Date')),
                    Expanded(flex: 3, child: _buildHeader('Action')),
                  ],
                ),
              ),
              Divider(thickness: 0.05.h),

              /// Table Rows
              ...List.generate(visibleEntries.length, (index) {
                final item = visibleEntries[index];
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 0.8.h),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: const Color(0xFFFFB800),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: _capsuleText(item['name']!, nameWidth),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: _capsuleText(item['truckId']!, truckIdWidth),
                          ),
                          Expanded(
                            flex: 3,
                            child: _capsuleText(
                              item['date']!,
                              dateWidth,
                              icon: Icons.date_range,
                            ),
                          ),
                          Expanded(flex: 3, child: _viewSheetButton()),
                        ],
                      ),
                    ),
                    if (index != visibleEntries.length - 1)
                      Divider(thickness: 0.05.h),
                  ],
                );
              }),

              SizedBox(height: 2.h),

              /// View Full Sheet Button
              Center(
                child: GestureDetector(
                  onTap: () => context.read<ViewToggleProvider>().toggleView(),
                  child: Column(
                    children: [
                      Icon(
                        viewAll
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Colors.black54,
                      ),
                      Text(
                        viewAll ? "Show Less" : "View Full Sheet",
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

  /// --- STYLING HELPERS ---

  TextStyle _headerStyle() => TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.bold,
    color: const Color(0xFFFFB800),
  );

  Widget _buildHeader(String title) {
    return Center(child: Text(title, style: _headerStyle()));
  }

  Widget _pillButton(String text, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(color: color, fontSize: 12.sp),
          ),
          SizedBox(width: 0.5.w),
          Icon(icon, color: color, size: 13.sp),
        ],
      ),
    );
  }

  Widget _capsuleText(String text, double width, {IconData? icon}) {
    return SizedBox(
      width: width,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                text,
                style: TextStyle(fontSize: 11.sp),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            if (icon != null) ...[
              SizedBox(width: 1.w),
              Icon(icon, size: 13.sp, color: Colors.grey),
            ],
          ],
        ),
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
