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
  var _imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('ImagePicker')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _imageView(_imagePath),
            RaisedButton(
              onPressed: _takePhoto,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Take photo!"),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            RaisedButton(
              onPressed: _openGallery,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Choice picture!',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //picture widge
  Widget _imageView(imagePath) {
    if (imagePath == null) {
      return Padding(
        padding: const EdgeInsets.only(top: 40.0, bottom: 40.0),
        child: Center(
          child: Text(
            "CHoice picture or takephoto",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
        ),
      );
    } else {
      return Image.file(imagePath);
    }
  }

  //take photo
  _takePhoto() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _imagePath = image;
    });
  }

  _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imagePath = image;
    });
  }
}
