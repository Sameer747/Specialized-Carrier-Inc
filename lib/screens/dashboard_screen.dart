import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart' hide ScreenType;
import 'package:specialized_carrier_inc_admin/providers/navigation_provider.dart';
import 'package:specialized_carrier_inc_admin/widgets/welcome_banner.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
        child: Column(
          children: [
            // top bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 7.h,
                  width: 40.w,
                  child: SearchBar(
                    hintStyle: WidgetStatePropertyAll(
                      TextStyle(color: Color(0xfffADADAD)),
                    ),
                    hintText: "Search...",
                    leading: Image.asset("images/search.png"),
                    shadowColor: WidgetStatePropertyAll(Colors.transparent),
                    backgroundColor: WidgetStatePropertyAll(Color(0xfffFCFBF5)),
                  ),
                ),
                // circle avatar
                PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'Settings') {
                      Provider.of<NavigationProvider>(
                        context,
                        listen: false,
                      ).changeScreen(ScreenType.settings);
                    }
                    // Handle menu selection
                    if (value == 'Logout') {
                      // Perform logout
                    } else if (value == 'Profile') {
                      // Navigate to profile screen
                    }
                  },
                  offset: Offset(0, 8.h),
                  itemBuilder: (BuildContext context) => [
                    const PopupMenuItem(
                      value: 'Profile',
                      child: Text('Profile'),
                    ),
                    const PopupMenuItem(value: 'Logout', child: Text('Logout')),
                    const PopupMenuItem(
                      value: 'Settings',
                      child: Text('Settings'),
                    ),
                  ],
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color(0xfffC7AE39),
                            width: 2,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(
                            'images/circle_avatar.png',
                          ), // or use NetworkImage
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                ),
              ],
            ),
            // welcome banner
            WelcomeBanner(),
          ],
        ),
      ),
    );
  }
}
