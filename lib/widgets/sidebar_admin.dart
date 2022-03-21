import 'package:flutter/material.dart';
import 'package:food/crud/sidebar_add_data_admin.dart';
import 'package:food/pages/auth_page/login.dart';
import 'package:food/pages/auth_page/sign_up.dart';

class SideBarAdmin extends StatefulWidget {
  const SideBarAdmin({ Key? key }) : super(key: key);

  @override
  State<SideBarAdmin> createState() => _SideBarAdminState();
}

class _SideBarAdminState extends State<SideBarAdmin> {
  @override
  Widget build(BuildContext context) {
    return ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: [
      SizedBox(height: 300,),
      ListTile(
        title: const Text('Add Data'),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeAdminPage()));
        },
      ),
      ListTile(
        title: const Text('Logout'),
         onTap: ()=> Navigator.pushReplacementNamed(context, '/LoginPage')
      ),
    ],
  );
  }
}