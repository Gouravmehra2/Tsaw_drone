import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/sigin.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import 'config.dart';
import 'applogo.dart';


class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isNotValidate = false;

  void registerUser() async{
   if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty){
     var requestbody ={
        "email":emailController.text,
        "password":passwordController.text
     };
      var respone = await http.post(Uri.parse(registration),
        headers: {"Content-Type" : "application/json"},
        body: jsonEncode(requestbody)
      );
      var jsonRespons = jsonDecode(respone.body);
      if(jsonRespons['status']){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInPage()));
      }
   }else{
     setState(() {
       _isNotValidate = true;
     });
   }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [const Color(0XFFF95A3B),const Color(0XFFF96713)],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomCenter,
                stops: [0.0,0.8],
                tileMode: TileMode.mirror
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CommonLogo(),
                  HeightBox(10),
                  "CREATE YOUR ACCOUNT".text.size(22).yellow100.make(),
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        errorStyle: TextStyle(color: Colors.white),
                        errorText: _isNotValidate ? "Enter Proper Info" : null,
                        hintText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)))),
                  ).p4().px24(),
                  TextField(
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(icon: Icon(Icons.copy),onPressed: (){
                          final data = ClipboardData(text: passwordController.text);
                          Clipboard.setData(data);
                        },),

                        filled: true,
                        fillColor: Colors.white,
                        errorStyle: TextStyle(color: Colors.white),
                        errorText: _isNotValidate ? "Enter Proper Info" : null,
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)))),
                  ).p4().px24(),
                  HStack([
                    GestureDetector(
                      onTap: ()=>{
                        registerUser()
                      },
                      child: VxBox(child: "Register".text.white.makeCentered().p16()).green600.roundedLg.make().px16().py16(),
                    ),
                  ]),
                  GestureDetector(
                    onTap: (){
                      print("Sign In");
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInPage()));

                    },
                    child: HStack([
                      "Already Registered?".text.make(),
                      " Sign In".text.white.make()
                    ]).centered(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
