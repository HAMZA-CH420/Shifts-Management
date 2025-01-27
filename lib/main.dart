import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shifts_management/UiHelpers/theme/App_Theme.dart';
import 'package:shifts_management/features/HomeScreen/viewModel/provider/chat_provider.dart';
import 'package:shifts_management/features/IntroScreens/Splash%20Screens/1st_Splash_Screen.dart';
import 'package:shifts_management/features/ShiftScreen/provider/Shift_Provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ShiftProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ChatProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shifts Management',
      theme: AppTheme.lightTheme,
      home: const FirstSplashScreen(),
    );
  }
}
