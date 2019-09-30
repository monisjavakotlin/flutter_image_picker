import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  var _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('ImagePicker')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _ImageView(_image),
            RaisedButton(
              onPressed: _takePhoto,
              child: Text("拍照"),
            ),
            RaisedButton(
              onPressed: _openGallery,
              child: Text("Choice picture"),
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
        child: Text("CHoice picture or takephoto"),
      );
    } else {
      return Image.file(imgPath);
    }
  }

  //take photo
  _takePhoto() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }
}
