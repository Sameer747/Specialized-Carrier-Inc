import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:specialized_carrier_inc_admin/providers/month_year_provider.dart';
import 'package:specialized_carrier_inc_admin/providers/navigation_provider.dart';
import 'package:specialized_carrier_inc_admin/providers/settings_provider.dart';
import 'package:specialized_carrier_inc_admin/providers/view_toggle_provider.dart';
import 'package:specialized_carrier_inc_admin/screens/login_screen.dart';
import 'package:specialized_carrier_inc_admin/screens/settings_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock orientation to landscape
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(const SpecializedCarrierIncAdminApp());
}

class SpecializedCarrierIncAdminApp extends StatelessWidget {
  const SpecializedCarrierIncAdminApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NavigationProvider()),
        ChangeNotifierProvider(create: (context) => MonthYearProvider()),
        ChangeNotifierProvider(create: (context) => ViewToggleProvider()),
        ChangeNotifierProvider(
          create: (_) => SettingsProvider(),
          child: SettingsScreen(),
        ),
      ],
      child: Sizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
            ),
            home: Builder(
              builder: (context) {
                // for tablet
                if (MediaQuery.sizeOf(context).width >= 768 &&
                    MediaQuery.sizeOf(context).width <= 1280) {
                  return LoginScreen();
                } else {
                  return Scaffold(body: Center(child: Text("Use a tablet")));
                }
              },
            ),
          );
        },
      ),
    );
  }
}
