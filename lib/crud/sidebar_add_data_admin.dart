import 'package:flutter/material.dart';
import 'package:food/crud/add_data.dart';
import 'package:food/crud/update_data.dart';
import 'package:food/colors.dart';
import 'package:food/crud_daging/add_daging.dart';
import 'package:food/crud_minuman/add_minuman_admin.dart';
import 'package:food/crud_sayuran/add_data_sayuran.dart';
class HomeAdminPage extends StatefulWidget {
  const HomeAdminPage({ Key? key }) : super(key: key);

  @override
  State<HomeAdminPage> createState() => _HomeAdminPageState();
}

class _HomeAdminPageState extends State<HomeAdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffAEFEFF),
       appBar: new AppBar(
        title: new Text("Add Data"),
        backgroundColor: darkGreen,
      ),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(height: 200,),
                  InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> AddData()));
                              },
                              child: Container(
                                height: 60,
                                width: 200,
                                child: Center(child: Text('Add Data', style: TextStyle(fontSize: 14, color: Colors.white),)),
                                decoration: BoxDecoration(
                                  color: darkGreen
                                ),
                              ),
                            ),
                            SizedBox(height: 20,),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> addDataSayuran()));
                              },
                              child: Container(
                                height: 60,
                                width: 200,
                                child: Center(child: Text('Add Data Sayuran', style: TextStyle(fontSize: 14, color: Colors.white),)),
                                decoration: BoxDecoration(
                                  color: darkGreen
                                ),
                              ),
                            ),
                             SizedBox(height: 20,),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> AddDagingAdmin()));
                              },
                              child: Container(
                                height: 60,
                                width: 200,
                                child: Center(child: Text('Add Data Daging', style: TextStyle(fontSize: 14, color: Colors.white),)),
                                decoration: BoxDecoration(
                                  color: darkGreen
                                ),
                              ),
                            ),
                             SizedBox(height: 20,),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> AddMinumanAdmin()));
                              },
                              child: Container(
                                height: 60,
                                width: 200,
                                child: Center(child: Text('Add Data Minuman', style: TextStyle(fontSize: 14, color: Colors.white),)),
                                decoration: BoxDecoration(
                                  color: darkGreen
                                ),
                              ),
                            ),
                            
                ],
              ),
            )
          ],))
    );
  }
}