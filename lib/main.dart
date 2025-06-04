import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:specialized_carrier_inc_admin/screens/login_screen.dart';

void main() {
  runApp(const SpecializedCarrierIncAdminApp());
}

class SpecializedCarrierIncAdminApp extends StatelessWidget {
  const SpecializedCarrierIncAdminApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        final deviceType = ScreenType.tablet;
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          // home: LoginScreen(),
          home: Builder(
            builder: (context) {
              if (MediaQuery.sizeOf(context).width >= 600 &&
                  MediaQuery.sizeOf(context).width <= 1200) {
                return LoginScreen();
              } else {
                return Scaffold(body: Center(child: Text("data")));
              }
            },
          ),
        );
      },
    );
  }
}
