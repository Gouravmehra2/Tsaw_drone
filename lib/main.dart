import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/dashboard.dart';
import 'package:todo/registration.dart';
import 'package:todo/sigin.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(token: prefs.getString('token'),));
}

class MyApp extends StatelessWidget {
  final token;
   MyApp({required this.token,super.key,});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print(token);
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.black,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: (token != null && !JwtDecoder.isExpired(token!))?Dashboard(token: token):SignInPage()
    );
  }
}