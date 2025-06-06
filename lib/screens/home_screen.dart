// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
// import 'package:specialized_carrier_inc_admin/screens/add_user_screen.dart';
// import 'package:specialized_carrier_inc_admin/screens/dashboard_screen.dart';
// import 'package:specialized_carrier_inc_admin/screens/settings_screen.dart';
// import 'package:specialized_carrier_inc_admin/screens/total_entries_screen.dart';
// import 'package:specialized_carrier_inc_admin/screens/user_list_screen.dart';
// import 'package:specialized_carrier_inc_admin/widgets/rounded_text_button.dart';
// import 'package:specialized_carrier_inc_admin/widgets/text_button.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         children: [
//           // left side
//           Container(
//             color: Colors.white70,
//             height: 100.h,
//             width: 25.w,
//             child: Padding(
//               padding: EdgeInsets.only(left: 3.w, top: 2.h),
//               child: Column(
//                 spacing: 2.h,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // logo
//                   Image.asset('images/homepage_logo.png'),

//                   // dashboard text
//                   Text(
//                     "ADMIN DASHBOARD",
//                     style: TextStyle(
//                       fontSize: 12.sp,
//                       color: Color(0xfff5A6A85),
//                     ),
//                   ),

//                   // main screen button
//                   // SizedBox(
//                   //   height: 7.h,
//                   //   width: 15.w,
//                   //   child: ElevatedButton(
//                   //     onPressed: () {
//                   //       Navigator.push(
//                   //         context,
//                   //         MaterialPageRoute(
//                   //           builder: (context) => DashboardScreen(),
//                   //         ),
//                   //       );
//                   //     },
//                   //     child: Row(
//                   //       mainAxisAlignment: MainAxisAlignment.center,
//                   //       children: [
//                   //         Image.asset("images/Vector.png", scale: 1.5),
//                   //         SizedBox(width: 0.5.w),
//                   //         Text(
//                   //           "Main Screen",
//                   //           style: TextStyle(fontSize: 12.sp),
//                   //         ),
//                   //       ],
//                   //     ),
//                   //   ),
//                   // ),
//                   RoundedTextButton(
//                     color: Color(0xfffFF004D),
//                     imagePath: "images/Vector.png",
//                     title: "Main Screen",
//                     isSelected: false,
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => DashboardScreen(),
//                         ),
//                       );
//                     },
//                   ),

//                   // divider
//                   Padding(
//                     padding: EdgeInsets.only(right: 7.w),
//                     child: SizedBox(
//                       height: 1.h,
//                       width: double.infinity,
//                       child: Divider(color: Colors.black),
//                     ),
//                   ),

//                   // navigation
//                   Text(
//                     "NAVIGATION",
//                     style: TextStyle(color: Color(0XFFF5A6A85)),
//                   ),

//                   // total entries
//                   CustomTextButton(
//                     color: Color(0xfff5A6A85),
//                     imagePath: "images/total_entries.png",
//                     title: "Total Entries",
//                     isSelected: true,
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => TotalEntriesScreen(),
//                         ),
//                       );
//                     },
//                   ),
//                   // add user
//                   CustomTextButton(
//                     color: Color(0xfff5A6A85),
//                     imagePath: "images/total_entries.png",
//                     title: "Add Users",
//                     isSelected: true,
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => TotalEntriesScreen(),
//                         ),
//                       );
//                     },
//                   ),
//                   // users list
//                   CustomTextButton(
//                     color: Color(0xfff5A6A85),
//                     imagePath: "images/total_entries.png",
//                     title: "Users List",
//                     isSelected: true,
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => TotalEntriesScreen(),
//                         ),
//                       );
//                     },
//                   ),
//                   // settings
//                   CustomTextButton(
//                     color: Color(0xfff5A6A85),
//                     imagePath: "images/total_entries.png",
//                     title: "Settings",
//                     isSelected: true,
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => TotalEntriesScreen(),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart' hide ScreenType;
import 'package:specialized_carrier_inc_admin/providers/navigation_provider.dart';
import 'package:specialized_carrier_inc_admin/screens/add_user_screen.dart';
import 'package:specialized_carrier_inc_admin/screens/dashboard_screen.dart';
import 'package:specialized_carrier_inc_admin/screens/settings_screen.dart';
import 'package:specialized_carrier_inc_admin/screens/total_entries_screen.dart';
import 'package:specialized_carrier_inc_admin/screens/user_list_screen.dart';
import 'package:specialized_carrier_inc_admin/widgets/rounded_text_button.dart';
import 'package:specialized_carrier_inc_admin/widgets/text_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget _getCurrentScreen(ScreenType screen) {
    switch (screen) {
      case ScreenType.dashboard:
        return const DashboardScreen();
      case ScreenType.totalEntries:
        return const TotalEntriesScreen();
      case ScreenType.addUser:
        return const AddUserScreen();
      case ScreenType.userList:
        // return const UserListScreen();
        return AllUsersTable();
      case ScreenType.settings:
        return const SettingsScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<NavigationProvider>(context);

    return Scaffold(
      // sidebar
      body: Row(
        children: [
          // Sidebar
          SingleChildScrollView(
            child: Container(
              width: 25.w,
              color: Colors.white70,
              child: Padding(
                padding: EdgeInsets.only(left: 3.w, top: 2.h),
                child: Column(
                  spacing: 3.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('images/homepage_logo.png'),
                    Text(
                      "ADMIN DASHBOARD",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xfff5A6A85),
                      ),
                    ),
                    RoundedTextButton(
                      color: const Color(0xfffFF004D),
                      imagePath: "images/Vector.png",
                      title: "Main Screen",
                      isSelected:
                          navProvider.currentScreen == ScreenType.dashboard,
                      onTap: () {
                        navProvider.changeScreen(ScreenType.dashboard);
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 6.w),
                      child: Divider(),
                    ),
                    Text(
                      "NAVIGATION",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xfff5A6A85),
                      ),
                    ),

                    // Navigation Buttons
                    CustomTextButton(
                      color: Color(0xfff5A6A85),
                      imagePath: "images/total_entries.png",
                      title: "Total Entries",
                      isSelected:
                          navProvider.currentScreen == ScreenType.totalEntries,
                      onTap: () =>
                          navProvider.changeScreen(ScreenType.totalEntries),
                    ),
                    CustomTextButton(
                      color: Color(0xfff5A6A85),
                      imagePath: "images/total_entries.png",
                      title: "Add Users",
                      isSelected:
                          navProvider.currentScreen == ScreenType.addUser,
                      onTap: () => navProvider.changeScreen(ScreenType.addUser),
                    ),
                    CustomTextButton(
                      color: Color(0xfff5A6A85),
                      imagePath: "images/total_entries.png",
                      title: "Users List",
                      isSelected:
                          navProvider.currentScreen == ScreenType.userList,
                      onTap: () =>
                          navProvider.changeScreen(ScreenType.userList),
                    ),
                    CustomTextButton(
                      color: Color(0xfff5A6A85),
                      imagePath: "images/total_entries.png",
                      title: "Settings",
                      isSelected:
                          navProvider.currentScreen == ScreenType.settings,
                      onTap: () =>
                          navProvider.changeScreen(ScreenType.settings),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // right side
          Container(
            color: Colors.white,
            width: 75.w,
            child: Padding(
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
                          shadowColor: WidgetStatePropertyAll(
                            Colors.transparent,
                          ),
                          backgroundColor: WidgetStatePropertyAll(
                            Color(0xfffFCFBF5),
                          ),
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
                          const PopupMenuItem(
                            value: 'Logout',
                            child: Text('Logout'),
                          ),
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
                                radius: 2.5.h,
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

                  // Right Screen Content
                  Expanded(child: _getCurrentScreen(navProvider.currentScreen)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
