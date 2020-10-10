import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Camera App!!"),
      ),
      body: Center(
        child: _image == null ? Text("No Image.") : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _optionDialogBox,
        child: Icon(Icons.add_a_photo),
        tooltip: "Open Camera",
      ),
    );
  }

  Future<void> _optionDialogBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text(
                      "Take a picture",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    onTap: openCamera,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  GestureDetector(
                    child: Text(
                      "Select a image from the gallery",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    onTap: openGallery,
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future openCamera() async {
    var image = await ImagePicker().getImage(source: ImageSource.camera);

    setState(() {
      _image = File(image.path);
    });
  }

  Future openGallery() async {
    var picture = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(picture.path);
    });
  }
}
