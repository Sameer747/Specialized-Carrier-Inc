import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart' hide ScreenType;
import 'package:specialized_carrier_inc_admin/widgets/total_entries_widget.dart';
import 'package:specialized_carrier_inc_admin/widgets/user_list_widget.dart';
import 'package:specialized_carrier_inc_admin/widgets/welcome_banner.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              // welcome banner
              WelcomeBanner(),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 1.w,
                children: [
                  TotalEntriesWidget(width: 36.w),
                  UsersListWidget(width: 36.w),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
