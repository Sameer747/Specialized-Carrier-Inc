import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart' hide ScreenType;
import 'package:specialized_carrier_inc_admin/providers/navigation_provider.dart';
import 'package:specialized_carrier_inc_admin/widgets/total_entries_widget.dart';
import 'package:specialized_carrier_inc_admin/widgets/user_list_widget.dart';
import 'package:specialized_carrier_inc_admin/widgets/welcome_banner.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // welcome banner
            WelcomeBanner(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [TotalEntriesWidget(), UsersListWidget()],
            ),
          ],
        ),
      ),
    );
  }
}
