import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImagePickerWidget(),
    );
  }
}

class ImagePickerWidget extends StatefulWidget {
  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  var _imgPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('ImagePicker')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _ImageView(_imgPath),
            RaisedButton(
              onPressed: _takePhoto,
              child: Text("拍照"),
            ),
            RaisedButton(
              onPressed: _openGallery,
              child: Text("選擇照片"),
            ),
          ],
        ),
      ),
    );
  }

  //圖片元件
  Widget _ImageView(imgPath) {
    if (imgPath == null) {
      return Center(
        child: Text("請選擇照片或拍照"),
      );
    } else {
      return Image.file(imgPath);
    }
  }
}
