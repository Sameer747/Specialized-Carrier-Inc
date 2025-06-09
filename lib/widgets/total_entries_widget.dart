import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart' hide ScreenType;
import 'package:specialized_carrier_inc_admin/providers/month_year_provider.dart';
import 'package:specialized_carrier_inc_admin/providers/navigation_provider.dart';

class TotalEntriesWidget extends StatelessWidget {
  final double width;
  const TotalEntriesWidget({super.key, required this.width});

  final List<Map<String, String>> sampleData = const [
    {"name": "John", "truckId": "2232", "date": "5/19/25"},
    {"name": "David", "truckId": "4455", "date": "6/10/25"},
    {"name": "Jordon", "truckId": "5678", "date": "6/5/25"},
    {"name": "Albert", "truckId": "7654", "date": "7/1/25"},
    {"name": "Lisa", "truckId": "4321", "date": "8/1/25"},
    {"name": "Maria", "truckId": "1234", "date": "9/1/25"},
    {"name": "Steve", "truckId": "5566", "date": "10/1/25"},
  ];

  List<Map<String, String>> _filterData(
    List<Map<String, String>> data,
    int? month,
    int year,
  ) {
    return data.where((item) {
      try {
        final date = DateFormat('M/d/yy').parse(item['date']!);
        return (month == null || date.month == month) && date.year == year;
      } catch (_) {
        return false;
      }
    }).toList();
  }

  Future<void> _showMonthPicker(BuildContext context) async {
    final months = List.generate(12, (index) => index + 1);
    final provider = Provider.of<MonthYearProvider>(context, listen: false);
    int tempYear = provider.selectedYear;

    await showDialog(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Select Month', style: TextStyle(fontSize: 15.sp)),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButton<int>(
                    value: tempYear,
                    items: List.generate(10, (index) {
                      int year = DateTime.now().year - 5 + index;
                      return DropdownMenuItem(
                        value: year,
                        child: Text('$year', style: TextStyle(fontSize: 14.sp)),
                      );
                    }),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          tempYear = value;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      GestureDetector(
                        onTap: () {
                          provider.updateMonth(null);
                          provider.updateYear(tempYear);
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 3.w,
                            vertical: 0.8.h,
                          ),
                          decoration: BoxDecoration(
                            color:
                                provider.selectedMonth == null &&
                                    tempYear == provider.selectedYear
                                ? Colors.red.shade100
                                : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text("All", style: TextStyle(fontSize: 12.sp)),
                        ),
                      ),
                      ...months.map((m) {
                        return GestureDetector(
                          onTap: () {
                            provider.updateMonth(m);
                            provider.updateYear(tempYear);
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 4.w,
                              vertical: 0.8.h,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  (m == provider.selectedMonth &&
                                      tempYear == provider.selectedYear)
                                  ? Colors.red.shade100
                                  : Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              DateFormat.MMM().format(DateTime(0, m)),
                              style: TextStyle(fontSize: 12.5.sp),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MonthYearProvider>(context);
    final filteredData = _filterData(
      sampleData,
      provider.selectedMonth,
      provider.selectedYear,
    );

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Entries',
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () => _showMonthPicker(context),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 2.w,
                    vertical: 0.8.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF1F5),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        provider.selectedMonth == null
                            ? 'Month'
                            : provider.formatted,
                        style: TextStyle(
                          color: const Color(0xFFFF004D),
                          fontWeight: FontWeight.bold,
                          fontSize: 11.sp,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: const Color(0xFFFF004D),
                        size: 15.sp,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          _buildTableHeader(),
          Divider(thickness: 0.05.h),

          if (filteredData.isEmpty)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              child: Text(
                'No entries for this month.',
                style: TextStyle(fontSize: 9.sp, color: Colors.grey),
              ),
            )
          else
            Column(
              children: List.generate(filteredData.take(5).length, (index) {
                final item = filteredData.take(5).toList()[index];
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
                          Expanded(
                            flex: 3,
                            child: _buildCapsule(item['name']!),
                          ),
                          Expanded(
                            flex: 3,
                            child: _buildCapsule(item['truckId']!),
                          ),
                          Expanded(
                            flex: 3,
                            child: _buildCapsule(item['date']!),
                          ),
                          Expanded(
                            flex: 3,
                            child: Align(
                              alignment: Alignment.center,
                              child: _buildButton(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (index != filteredData.take(5).length - 1)
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
                ).changeScreen(ScreenType.totalEntries);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF004D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Text(
                'View All Entries',
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
          Expanded(flex: 3, child: _buildHeader('Name')),
          Expanded(flex: 3, child: _buildHeader('Truck ID')),
          Expanded(flex: 3, child: _buildHeader('Date')),
          Expanded(flex: 3, child: _buildHeader('Action')),
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
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 11.5.sp),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<NavigationProvider>(
          context,
          listen: false,
        ).changeScreen(ScreenType.totalEntries);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 0.73.w, vertical: 0.7.h),
        decoration: BoxDecoration(
          color: const Color(0xFFE3E7EF),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          'View Sheet',
          style: TextStyle(
            fontSize: 11.8.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
