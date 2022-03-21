import 'dart:async';
import 'package:path/path.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:food/colors.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as Img;
import 'dart:math' as Math;
class addDataSayuran extends StatefulWidget {
  const addDataSayuran({ Key? key }) : super(key: key);

  @override
  State<addDataSayuran> createState() => _addDataSayuranState();
}

class _addDataSayuranState extends State<addDataSayuran> {
  File ? _image;
  TextEditingController foto_makanan = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController penjelasan = TextEditingController();
  TextEditingController kandungan = TextEditingController();
  TextEditingController manfaat = TextEditingController();
  TextEditingController dampak_buruk = TextEditingController();

 Future _getImageGallery() async {

    var imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);

   final tempDir =await getTemporaryDirectory();
  final path = tempDir.path;

  int rand= new Math.Random().nextInt(100000);

  Img.Image ? image= Img.decodeImage(await imageFile!.readAsBytes());
  Img.Image smallerImg = Img.copyResizeCropSquare(image!,500);

  var compressImg= new File("$path/image_$rand.jpg")
  ..writeAsBytesSync(Img.encodeJpg(smallerImg, quality: 85));


  setState(() {
      _image = compressImg;
    });
    
  }

Future addData(imageFile) async{
   var stream= new http.ByteStream(DelegatingStream.typed(imageFile.openRead())); 
   var length= await imageFile.length();
   var url =Uri.parse("http://192.168.254.107/food_fullstack/api_food/addDataSayuran.php");

   var request = new http.MultipartRequest("POST", url);
   var multipartFile = new http.MultipartFile("image", stream, length, filename: basename(imageFile.path));
   request.fields['nama'] = nama.text;
   request.fields['penjelasan'] = penjelasan.text;
   request.fields['kandungan'] = kandungan.text;
   request.fields['manfaat']= manfaat.text;
   request.fields['dampak_buruk'] = dampak_buruk.text;
   request.files.add(multipartFile);


   var response = await request.send();

   if(response.statusCode==200){
    print("Image Uploaded");
    }else{
    print("Upload Failed");
  }
  response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
 

 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: new AppBar(
        title: new Text("Add Data"),
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
                   Center(
                    child: _image == null
                    ? new Text('No Image selected')
                    : new Image.file(_image!)
                    ,
                  ),
                  RaisedButton(
                    child: Icon(Icons.image),
                    onPressed: () async{
                      await _getImageGallery();
                    },),
                new TextField(
                  controller: nama,
                  decoration: new InputDecoration(
                    hintText: "nama_buah",
                    labelText: "nama_buah",
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
                  child: new Text("ADD DATA",style: TextStyle(color: Colors.white),),
                  color: darkGreen,
                  onPressed: () {
                    addData(_image!);
                    Navigator.pop(context);
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