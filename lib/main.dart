import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:specialized_carrier_inc_admin/providers/navigation_provider.dart';
import 'package:specialized_carrier_inc_admin/screens/home_screen.dart';

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
      ],
      child: Sizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
            ),
            // home: LoginScreen(),
            home: Builder(
              builder: (context) {
                if (MediaQuery.sizeOf(context).width >= 600 &&
                    MediaQuery.sizeOf(context).width <= 1280) {
                  return HomeScreen();
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
