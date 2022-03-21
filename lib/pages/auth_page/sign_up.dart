import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food/colors.dart';
import 'package:food/pages/auth_page/login.dart';
import 'package:food/widgets/field_bar.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();



  void addUser(){
    var url =Uri.parse("http://192.168.254.107/food_fullstack/api_food/sign_up.php");
    
   var response = http.post(url, body: {
      "username": username.text,
      "password": password.text,
    });

    

  
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffAEFEFF),
      body:  SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                Column(
                  children: [
                    SizedBox(height: 150,),
                    Center(child: Text('Sign Up',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 36),)),
                    SizedBox(height: 50,),
                    TextFieldContainer(
                      child: TextField(
                        controller: username,
                        decoration: InputDecoration(
                          hintText: "Username",
                          icon: Icon(Icons.person, color: Colors.black,),
                          border: InputBorder.none,
                          ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFieldContainer(
                      child: TextField(
                        controller: password,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Password",
                          icon: Icon(Icons.password, color: Colors.black,),
                          border: InputBorder.none,
                          ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextFieldContainer(
                      child: TextField(
                        controller: password,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          icon: Icon(Icons.password_rounded, color: Colors.black,),
                          border: InputBorder.none,
                          ),
                      ),
                    ),
                  
                    SizedBox(height: 40,),
                    Center(
                      child: Container(
                        height: 56,
                        width: 210,
                        child: RaisedButton(
                          onPressed: (){
                            addUser();
                           Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                          },
                          child: Text('Register', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20, color: Colors.white),),
                          color: darkGreen,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ),
                    SizedBox(height: 12,),
                    Center(
                      child: Container(
                        height: 56,
                        width: 210,
                        child: RaisedButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                          },
                          child: Text('Login', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20, color: Colors.white),),
                          color: darkGreen,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                    ),
                   
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

