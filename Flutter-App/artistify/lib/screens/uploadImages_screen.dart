import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:google_fonts/google_fonts.dart';

import 'result_screen.dart';

class UploadImage extends StatefulWidget {
  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
List _outputs;
  File _image;
  bool _loading = false;
  String path;
  @override
  void initState() {
    super.initState();
    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Prediction'),
      ),
      body: _loading
          ? Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      )
          : Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image == null ? Container() : Image.file(_image),
            SizedBox(
              height: 20,
            ),
            _outputs != null
                ? InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ImagePrediction(outputPrediction: "${_outputs[0]["label"]}",imagepath: path)));
                        },
                        child: Container(
                            height: 50.0,
                            width: 125.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white),
                            child: Center(
                                child: Text('Show results',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                        textStyle: TextStyle(
                                            color: Color(0xFFFFBD73)))))))
            //     Text(
            //   "${_outputs[0]["label"]}",
            //   style: TextStyle(
            //     color: Colors.black,
            //     fontSize: 20.0,
            //     background: Paint()..color = Colors.white,
            //   ),
            // )
                : Container()
          ],
        ),
      ),
      floatingActionButton: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: FloatingActionButton(
                      heroTag: null,
                      onPressed: pickImage,
                      tooltip: 'Pick Image from Gallery',
                      child: Icon(Icons.image),
                      backgroundColor: Color(0xFFFFBD73),
                      foregroundColor: Color(0xFF1B1B1B),
                  ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
                      heroTag: null,
                      onPressed: clickImage,
                      tooltip: 'Pick Image',
                      child: Icon(Icons.linked_camera_rounded),
                      backgroundColor: Color(0xFFFFBD73),
                      foregroundColor: Color(0xFF1B1B1B),
                  ),
          ),
        ],
      // ),FloatingActionButton(
      //   onPressed: pickImage,
      //   child: Icon(Icons.image),
      // ),
    ),
    );
  }

  pickImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = image;
      path = image.path;

    });
    classifyImage(image);
  }

  clickImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera, maxWidth: 400, maxHeight: 400);
    if (image == null) return null;
    setState(() {
       path = image.path;
      _loading = true;
      _image = image;
    });
    classifyImage(image);
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _loading = false;
      _outputs = output;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
    );
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}

