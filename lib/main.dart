import 'package:chaty/home/app_cubit/app_cubit.dart';
import 'package:chaty/screens/Login_Screen/login.dart';
import 'package:chaty/constance/uId.dart';
import 'package:chaty/home/home.dart';
import 'package:chaty/shared/shared_prefrence/shared_prefrence.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.init();
  await Firebase.initializeApp();
  uId = await SharedPrefs.getData(key: 'uId') ;
  Widget? startWidget;
  if (uId != null) {
    startWidget = Home();
  }else
  {
    startWidget = LoginScreen();
  }
  runApp(MyApp(startWidget: startWidget,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.startWidget});
  final Widget? startWidget;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // appBarTheme:
          //     AppBarTheme(backgroundColor: Colors.orange[900], elevation: 0),
          ),
      home: startWidget,
    );
  }
}
