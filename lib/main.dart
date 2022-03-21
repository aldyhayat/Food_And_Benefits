// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:food/pages/admin_user_page/admin_page.dart';
import 'package:food/pages/auth_page/login.dart';
import 'package:food/pages/auth_page/sign_up.dart';
// import 'package:food/pages/auth_page/sign_up.dart';
// import 'package:food/pages/detail_screen.dart';
import 'package:food/pages/home_screen.dart';
import 'package:food/pages/list_sayuran.dart';
import 'package:food/pages/splash_screen.dart';
// import 'package:food/pages/coba_screen.dart';
// import 'package:food/pages/list_Screen.dart';
// import 'pages/splash_screen.dart';
// import 'package:food/pages/auth_page/login.dart';
void main() {
  runApp( MyApp());
}


class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Healty Food',
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/AdminPage':(BuildContext context) => new AdminPage(username: $username,),
        '/UserPage':(BuildContext context) => new HomePage(),
        '/LoginPage':(BuildContext context) => new LoginPage(),
      },
    );
  }
}