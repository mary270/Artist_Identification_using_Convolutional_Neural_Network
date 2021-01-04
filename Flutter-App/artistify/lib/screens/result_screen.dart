import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImagePrediction extends StatefulWidget {
  final String outputPrediction,imagepath;

  ImagePrediction({this.outputPrediction,this.imagepath});

  @override
  _ImagePredictionState createState() => _ImagePredictionState();
}

class _ImagePredictionState extends State<ImagePrediction> {
  // get outputPrediction => null;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        backgroundColor: Color(0xFF202020),
        body: Stack(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Container(
                  height: 200.0,
                  width: 325.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                           image: AssetImage(widget.imagepath),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.2),
                              BlendMode.darken), )),
                )),
            Positioned(
                top: 125.0,
                left: 10.0,
                child: Container(
                    width: MediaQuery.of(context).size.width ,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(widget.outputPrediction.toString(),
                                style: GoogleFonts.montserrat(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    textStyle: TextStyle(color: Colors.white))),
                            Text(
                              'Biography',
                              style: GoogleFonts.montserrat(
                                  fontSize: 14.0,
                                  textStyle:
                                      TextStyle(color: Colors.white)),
                            )
                          ],
                        ),
                        // Container(
                        //   height: 40.0,
                        //   width: 40.0,
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(7.0),
                        //       color: Colors.white),
                        //   child: Center(
                        //     child: Icon(Icons.arrow_forward_ios, color: Color(0xFFFFBD73), size: 14.0),
                        //   ),
                        // )
                      ],
                    )))
          ],
        ));
  }
}
