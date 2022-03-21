import 'package:flutter/material.dart';
import 'package:food/colors.dart';
import 'package:food/pages/auth_page/login.dart';
import 'package:food/pages/auth_page/sign_up.dart';
import 'package:food/pages/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffAEFEFF),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 57,),
                Padding(
                  padding: const EdgeInsets.only(right: 35),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/images/logo.png')),
                      ),
                     ),
                  ),
                ),
                SizedBox(height: 87,),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Text('Yuk mulai mencari\nmakanan sehat', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),),
                ),
                SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Text('cari manfaat baik di setiap\nmakanan', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),),
                ),
                SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.only(left: 73),
                  child: Container(
                    height: 56,
                    width: 210,
                    child: RaisedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Text('Mulai', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20, color: toska),),
                      color: darkGreen,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                SizedBox(height: 87,),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                      height: 243,
                      width: 472,
                      decoration: BoxDecoration(
                        color: litteGreen,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(185),
                          topRight: Radius.circular(185),
                        )
                      ),
                    ),
                  ),
                )
                      ],),
          ],
        ),
        ),
    );
  }
}