import 'package:flutter/material.dart';
import 'package:food/colors.dart';
import 'package:food/crud/list_admin.dart';
import 'package:food/crud_daging/list_daging.dart';
import 'package:food/crud_minuman/list_minuman_admin.dart';
import 'package:food/crud_sayuran/list_sayuran_admin.dart';
import 'package:food/main.dart';
import 'package:food/pages/coba_screen.dart';
import 'package:food/pages/list_sayuran.dart';
import 'package:food/widgets/sidebar.dart';
import 'package:food/pages/auth_page/login.dart';
import 'package:food/widgets/sidebar_admin.dart';
class AdminPage extends StatefulWidget {
  AdminPage({this.username});
  final String ? username;

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
 
  
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xffAEFEFF),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 42, top: 34),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: (){
                      _scaffoldKey.currentState?.openDrawer();
                    }, icon: Icon(Icons.list_outlined, size: 32,)),
                    SizedBox(height: 12,),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Text('Hello ${$username}', style: TextStyle(color: darkGreen, fontSize: 30, fontWeight: FontWeight.w600),),
                    ),
                    SizedBox(height: 12,),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Text('Cari Manfaat makanan.', style: TextStyle(color: darkGreen, fontSize: 20),),
                    ),
                    SizedBox(height: 80,),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> ListAdmin()));
                            },
                            child: Container(
                              height: 120,
                              width: 120,
                              child: Center(child: Text('Buah-buahan', style: TextStyle(fontSize: 14, color: Colors.white),)),
                              decoration: BoxDecoration(
                                color: darkGreen
                              ),
                            ),
                          )
                        ),
                        SizedBox(width: 32,),
                         InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> ListSayuranAdmin()));
                            },
                           child: Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: Container(
                              height: 120,
                              width: 120,
                              child: Center(child: Text('Sayuran', style: TextStyle(fontSize: 14, color: Colors.white),)),
                              decoration: BoxDecoration(
                                color: darkGreen
                              ),
                            )
                                                 ),
                         ),
                      ],
                    ),
                    SizedBox(height: 55,),
                    Row(
                      children: [
                        InkWell(
                          onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> ListDaging()));
                            },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: Container(
                              height: 120,
                              width: 120,
                              child: Center(child: Text('Daging', style: TextStyle(fontSize: 14, color: Colors.white),)),
                              decoration: BoxDecoration(
                                color: darkGreen
                              ),
                            )
                          ),
                        ),
                        SizedBox(width: 32,),
                         InkWell(
                           onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> ListMinumanAdmin()));
                            },
                           child: Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: Container(
                              height: 120,
                              width: 120,
                              child: Center(child: Text('Minuman', style: TextStyle(fontSize: 14, color: Colors.white),)),
                              decoration: BoxDecoration(
                                color: darkGreen
                              ),
                            )
                                                 ),
                         ),
                      ],
                    ),
                  
                ],
              ),
            ),
          ],
        )),
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(left: 40),
      //   child: Container(
      //     height: 65,
      //     width: MediaQuery.of(context).size.width - (2 * 24),
      //     margin: EdgeInsets.symmetric(horizontal:24),
      //     decoration: BoxDecoration(
      //       color: Colors.white,
      //       borderRadius: BorderRadius.circular(24),
      //     ),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //        IconButton(onPressed: (){
      //          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      //        }, icon: Icon(Icons.home, size: 30,)),
      //        SizedBox(width: 70,),
      //        IconButton(onPressed: (){}, icon: Icon(Icons.account_box,size: 30,)),
      //       ],
      //     ),
      //   ),
      // ),
      drawer:Drawer(

  child: SideBarAdmin(),
),
    );
  
  }
}