import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shifts_management/UiHelpers/theme/App_Theme.dart';
import 'package:shifts_management/features/AuthenticationScreens/Login%20Screen/Login_Screen.dart';
import 'package:shifts_management/features/Bottom%20NavBar/Bottom_navBar.dart';
import 'package:shifts_management/features/ShiftScreen/provider/Shift_Provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ShiftProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Flexify(
      designHeight: 375,
      designWidth: 812,
      app: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shifts Management',
        theme: AppTheme.lightTheme,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.data != null) {
              return const BottomNavbar();
            } else {
              return LoginScreen();
            }
          },
        ),
      ),
    );
  }
}
