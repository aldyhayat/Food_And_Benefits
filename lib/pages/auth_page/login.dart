import 'package:flutter/material.dart';
import 'package:food/colors.dart';
import 'package:food/widgets/field_bar.dart';
import 'package:http/http.dart' as http;
import 'package:food/pages/admin_user_page/admin_page.dart';
import 'package:food/pages/home_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'dart:convert';
import 'package:food/main.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

String $username = '';
String $data = '';
class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  String msg='';
  void _login() async {
  //   ProgressDialog progressDialog = ProgressDialog(context: context);
  // progressDialog.show(max: 0, msg: "Loading");
    final response = await http.post(Uri.parse('http://192.168.254.107/food_fullstack/api_food/login.php'), body: {
      "username" : user.text,
      "password" : pass.text,
    });
    // progressDialog.close();
  var datauser= json.decode(response.body);
  
  
    if(datauser.length==0){
    setState(() {
          Alert(context: context, title: "Data Anda Salah",type: AlertType.error)
          .show();
        });
    return;      
  }


  if(response.statusCode == 200){
     
    if(datauser[0]['level']=='admin'){
      Alert(context: context, title: "Data Anda Benar",type: AlertType.success)
          .show();
       Navigator.pushReplacementNamed(context, '/AdminPage');
       
    }else if(datauser[0]['level']=='user'){
      Alert(context: context, title: "Data Anda Benar",type: AlertType.success)
          .show();
      Navigator.pushReplacementNamed(context, '/UserPage');
    }
    
  setState(() {
         $username= datauser[0]['username'];
         $data= datauser[0]['admin'];
        });
  }


   return datauser;
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
                    Center(child: Text('Login',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 36),)),
                    SizedBox(height: 50,),
                    TextFieldContainer(
                      child: TextField(
                        controller: user,
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
                        controller: pass,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Password",
                          icon: Icon(Icons.password_outlined, color: Colors.black,),
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
                            _login();
                           
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


