import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImagePickerPage(),
    );
  }
}

class ImagePickerPage extends StatefulWidget {
  ImagePickerPage({Key key}) : super(key: key);

  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  //记录选择的照片
  File _image;

  //当图片上传成功后，记录当前上传的图片在服务器中的位置
  String _imgServerPath;

  //拍照
  Future _getImageFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera, maxWidth: 400);
    setState(() {
      _image = image;
    });
  }

  //相册选择
  Future _getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  Future _getFile() async {
    var image = await FilePicker.getFile(type: FileType.custom);
    setState(() {
      _image = image;
    });
  }


  //上传图片到服务器
  _uploadImage(File file) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path, filename: fileName)
    });
    var response = await Dio().post("http://123.56.167.84:8080/File/uploadFile", data: formData);
    print('|||||||||||||||||||||||||||||||||||||||||||');
    print('|||||||||||||||||||||||||||||||||||||||||||');
    print('|||||||||||||||||||||||||||||||||||||||||||');
    print('|||||||||||||||||||||||||||||||||||||||||||');
    print(response);
    print('|||||||||||||||||||||||||||||||||||||||||||');
    print('|||||||||||||||||||||||||||||||||||||||||||');
    print('|||||||||||||||||||||||||||||||||||||||||||');
    print('|||||||||||||||||||||||||||||||||||||||||||');
    print('|||||||||||||||||||||||||||||||||||||||||||');
    /*if (response.statusCode == 200) {
      Map responseMap = response.data;
      print("http://jd.itying.com${responseMap["path"]}");
      setState(() {
        _imgServerPath = "http://jd.itying.com${responseMap["path"]}";
      });
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("选择图片并上传")),
      body: Container(
        child: ListView(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                _getFile();
              },
              child: Text("文件"),
            ),
            RaisedButton(
              onPressed: () {
                _getImageFromCamera();
              },
              child: Text("照相机"),
            ),
            SizedBox(height: 10),
            RaisedButton(
              onPressed: () {
                _getImageFromGallery();
              },
              child: Text("相册"),
            ),
            SizedBox(height: 10),
            /**
             * 展示选择的图片
             */
            _image == null
                ? Text("no image selected")
                : Image.file(
              _image,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            RaisedButton(
              onPressed: () {
                _uploadImage(_image);
              },
              child: Text("上传图片到服务器"),
            ),
            SizedBox(height: 10),
            _imgServerPath == null
                ? Text("没有上传图片")
                : Image.network(
                "http://jd.itying.com/public/upload/daoyXVTvrCCUeoIliZtNXX-s.png"),
          ],
        ),
      ),
    );
  }
}