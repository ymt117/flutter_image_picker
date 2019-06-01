import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'dart:typed_data';

void main() => runApp(new CameraApp());

class CameraApp extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  File image;
  Uint8List _imageBytes;

//  To use Gallery or File Manager to pick Image
//  Comment Line No. 19 and uncomment Line number 20
  picker() async {
    print('Picker is called');
//    File img = await ImagePicker.pickImage(source: ImageSource.camera);
    File img = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      image = img;
      // Convert to
      //String base64Image = base64Encode(image.readAsBytesSync());
      String base64Image = base64.encode(image.readAsBytesSync());
      //Uint8List _imageBytes = Base64Decoder().convert(base64Image);
      Uint8List _imageBytes = base64.decode(base64Image);
      setState(() {
        _imageBytes = _imageBytes;
      });
      print("image = ");
      print(image);
      print("byte");
      print(image.readAsBytesSync());
      print("base64Image = ");
      print(base64Image);
      print("decoded image = ");
      print(new Image.memory(_imageBytes));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Image Picker'),
        ),
        /*body: new Container(
          child: new Center(
            child: image == null
                ? new Text('No Image to Show')
                : new Image.memory(_imageBytes),
          ),
        ),*/
        body: new ListTile(
          leading: image == null
              ? Icon(Icons.ac_unit)
              : new Image.memory(_imageBytes),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: picker,
          child: new Icon(Icons.camera_alt),
        ),
      ),
    );
  }
}
