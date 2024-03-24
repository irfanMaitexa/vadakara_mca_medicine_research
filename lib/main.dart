import 'package:flutter/material.dart';
import 'package:medicine_research/db/shared_pref.dart';
import 'package:medicine_research/modules/auth/login.dart';
import 'package:medicine_research/modules/physcian/phy_home.dart';
import 'package:medicine_research/modules/staff/staff_root_screen.dart';
import 'package:medicine_research/modules/user/user_root_screen.dart';

void main() async{

   WidgetsFlutterBinding.ensureInitialized();

  await DbService.init();

  


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey.shade100),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white
      ),
      home: LoginScreen(),
    );
  }
}