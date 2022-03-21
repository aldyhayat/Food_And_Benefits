import 'package:flutter/material.dart';
import 'package:food/pages/auth_page/sign_up.dart';

class SideBar extends StatelessWidget {
  const SideBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: [
      SizedBox(height: 300,),
      ListTile(
        title: const Text('Logout'),
         onTap: ()=> Navigator.pushReplacementNamed(context, '/LoginPage')
      ),
    ],
  );
  }
}