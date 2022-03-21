import 'package:flutter/material.dart';
import 'package:food/colors.dart';
import 'package:food/pages/admin_user_page/admin_page.dart';
import 'package:http/http.dart' as http;

class UpdateDaging extends StatefulWidget {
  final List ?list;
  final int ?index;

  UpdateDaging({this.list,this.index});

  @override
  State<UpdateDaging> createState() => _UpdateDagingState();
}

class _UpdateDagingState extends State<UpdateDaging> {
  late TextEditingController foto_makanan;
  late TextEditingController nama;
  late TextEditingController penjelasan;
  late TextEditingController kandungan;
  late TextEditingController manfaat;
  late TextEditingController dampak_buruk;


  void updateData(){
    var url= Uri.parse("http://192.168.254.107/food_fullstack/api_food/updateDaging.php") ;
    http.post(url,body: {
      "id": widget.list?[widget.index!]['id'],
      "foto_makanan": foto_makanan.text,
      "nama": nama.text,
      "penjelasan": penjelasan.text,
      "kandungan": kandungan.text,
      "manfaat": manfaat.text,
      "dampak_buruk": dampak_buruk.text,
    });
  }
  
  @override
  void initState() {
    foto_makanan= new TextEditingController(text: widget.list?[widget.index!]['foto_makanan'] );
  nama= new TextEditingController(text: widget.list?[widget.index!]['nama'] ); 
  penjelasan= new TextEditingController(text: widget.list?[widget.index!]['penjelasan'] ); 
  kandungan= new TextEditingController(text: widget.list?[widget.index!]['kandungan'] ); 
  manfaat= new TextEditingController(text: widget.list?[widget.index!]['manfaat'] ); 
  dampak_buruk= new TextEditingController(text: widget.list?[widget.index!]['dampak_buruk'] ); 
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Update DATA Sayuran"),
        backgroundColor: darkGreen,
      ),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            ListView(
              children: [
                Column(
                  children: [
                    new TextField(
                  controller: foto_makanan,
                  decoration: new InputDecoration(
                    hintText: "foto_makanan",
                    labelText: "foto_makanan",
                  )
                ),
                new TextField(
                  controller: nama,
                  decoration: new InputDecoration(
                    hintText: "nama",
                    labelText: "nama",
                  )
                ),
                new TextField(
                  controller: penjelasan,
                  decoration: new InputDecoration(
                    hintText: "penjelasan",
                    labelText: "penjelasan",
                  )
                ),
                new TextField(
                  controller: kandungan,
                  decoration: new InputDecoration(
                    hintText: "kandungan",
                    labelText: "kandungan",
                  )
                ),
                new TextField(
                  controller: manfaat,
                  decoration: new InputDecoration(
                    hintText: "manfaat",
                    labelText: "manfaat",
                  )
                ),
                new TextField(
                  controller: dampak_buruk,
                  decoration: new InputDecoration(
                    hintText: "dampak_buruk",
                    labelText: "dampak_buruk",
                  )
                ),
                SizedBox(height: 16,),
                 new RaisedButton(
                  child: new Text("Update DATA",style: TextStyle(color: Colors.white),),
                  color: darkGreen,
                  onPressed: () {
                     setState(() {
                         
                            updateData();
                             Navigator.of(context).push(
                              new MaterialPageRoute(
                        builder: (BuildContext context)=>new AdminPage()
                      )
                    );
                          
                        });
                  },
                )
                  ],
                ),
              ],
            )
          ],
        )),
    );
  }
}