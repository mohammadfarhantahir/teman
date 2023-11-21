import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';

import 'dart:io'; // Import this for File class
import 'package:http/http.dart' as http;

class PassportCameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  PassportCameraScreen({required this.cameras});

  @override
  _PassportCameraScreenState createState() => _PassportCameraScreenState();
}

class _PassportCameraScreenState extends State<PassportCameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  late String countrytext;
  late String dateOfBirthtext;
  late String nationalitytext;
  late String sextext;
  late String surnametext;
  late String checkExpirationDatetext;
  late String expirationDatetext;
  @override
  void initState() {
    super.initState();

    final camera = widget.cameras.isNotEmpty ? widget.cameras[0] : null;

    if (camera != null) {
      _controller = CameraController(
        camera,
        ResolutionPreset.medium,
      );
      _initializeControllerFuture = _controller.initialize();
    }
  }





  Future<void> _captureAndSendImage() async {
    try {
      await _initializeControllerFuture;
      final image = await _controller.takePicture();
      final imageFile = File(image.path);

      // Rotate the image using flutter_exif_rotation package
      final rotatedImageFile = await FlutterExifRotation.rotateAndSaveImage(
        path: imageFile.path,
      //  quality: 100,
      );

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://raptorassistant.com:1345/process'),
      );

      request.files.add(
        http.MultipartFile(
          'imagefile',
          rotatedImageFile.readAsBytes().asStream(),
          rotatedImageFile.lengthSync(),
          filename: rotatedImageFile.path,
        ),
      );

      var response = await request.send();

      print('Response Status Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        print(responseBody);

        final parsedResponse = json.decode(responseBody);

        final checkExpirationDate = parsedResponse['check_expiration_date'];
        final checkNumber = parsedResponse['check_number'];
        final country = parsedResponse['country'];
        final dateOfBirth = parsedResponse['date_of_birth'];
        final expirationDate = parsedResponse['expiration_date'];
        final names = parsedResponse['names'];
        final nationality = parsedResponse['nationality'];
        final number = parsedResponse['number'];
        final sex = parsedResponse['sex'];
        final surname = parsedResponse['surname'];
        final type = parsedResponse['type'];
        setState(() {
          countrytext = country.toString();
          dateOfBirthtext = dateOfBirth.toString();
          nationalitytext= nationality.toString();
          sextext = sex.toString();
          surnametext = surname.toString();
          checkExpirationDatetext = checkExpirationDate.toString();
          expirationDatetext = expirationDate.toString();

        });
        _showResponseAlert(responseBody);
      } else {
        final responseBody = await response.stream.bytesToString();
        print('Failed to send image to the server. Response Body: $responseBody');
        _showResponseAlerterror('This is not a passport image');
      }
    } catch (e) {
      print('Error: $e');
      _showResponseAlerterror('Error: $e');
    }
  }
  void _showResponseAlert(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Passport Response'),
          content: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child:Text('Full Name: ',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                  ),
                  Expanded(
                      child:Text(surnametext,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal
                        ),
                      )
                  )
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                      child: Text('Gender: ',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                        ),
                      )
                  ),
                  Expanded(
                      child: Text(sextext,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal
                    ),
                  )
                  )
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                 Expanded(
                     child: Text('Country: ',
                       style: TextStyle(
                           fontSize: 22,
                           fontWeight: FontWeight.bold
                       ),
                     )
                 ),
                  Expanded(
                      child:Text(countrytext,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal
                        ),
                      )
                  )
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                      child:Text('Expiry Date: ',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                        ),
                      )
                  ),
                  Expanded(
                      child: Text(checkExpirationDatetext,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal
                        ),
                      )
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child:Text('Date of birth: ',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                        ),
                      )
                  ),
                  Expanded(
                      child:Text(dateOfBirthtext,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal
                        ),
                      )
                  )
                ],
              )


            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }


  void _showResponseAlerterror(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error Response'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0Xff12283D),
      appBar: AppBar(
        backgroundColor: Color(0Xff12283D),
        leading: Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white)
          ),
          child: Icon(Icons.arrow_back),
        ),
        title: Text('Upload Passport'),
      ),
      body: Stack(
        children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_controller);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          Positioned.fill(
            child: CustomPaint(
              painter: PassportOverlayPainter(),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: (){

                    _captureAndSendImage();
                    print('camera clicked');
                  },
                  child: CachedNetworkImage(
                    imageUrl: "https://raptorassistant.com/teman/assets/camera/camera_ring.png",
                    imageBuilder: (context, imageProvider) => Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          //  colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                        ),
                      ),

                    ),
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),

                  /* ElevatedButton(
                onPressed: () async {
                  try {
                    await _initializeControllerFuture;
                    final image = await _controller.takePicture();
                    // TODO: Process the captured image
                  } catch (e) {
                    print(e);
                  }
                },
                child: Text('Capture'),
              ),*/

                ),
                SizedBox(height: 20,)
              ],
            ),
          ),


        ],
      ),
    );
  }
}

class PassportOverlayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final rectWidth = size.width * 0.7;
    final rectHeight = size.height * 0.5;
    final rectLeft = (size.width - rectWidth) / 2;
    final rectTop = (size.height - rectHeight) / 2;

    final rect = Rect.fromLTWH(rectLeft, rectTop, rectWidth, rectHeight);
    canvas.drawRect(rect, paint);

    final cornerSize = 20.0;
    final topLeftCorner = Offset(rectLeft, rectTop);
    final topRightCorner = Offset(rectLeft + rectWidth, rectTop);
    final bottomLeftCorner = Offset(rectLeft, rectTop + rectHeight);
    final bottomRightCorner = Offset(rectLeft + rectWidth, rectTop + rectHeight);

    canvas.drawLine(topLeftCorner, topLeftCorner + Offset(cornerSize, 0), paint);
    canvas.drawLine(topLeftCorner, topLeftCorner + Offset(0, cornerSize), paint);

    canvas.drawLine(topRightCorner, topRightCorner - Offset(cornerSize, 0), paint);
    canvas.drawLine(topRightCorner, topRightCorner + Offset(0, cornerSize), paint);

    canvas.drawLine(bottomLeftCorner, bottomLeftCorner + Offset(cornerSize, 0), paint);
    canvas.drawLine(bottomLeftCorner, bottomLeftCorner - Offset(0, cornerSize), paint);

    canvas.drawLine(bottomRightCorner, bottomRightCorner - Offset(cornerSize, 0), paint);
    canvas.drawLine(bottomRightCorner, bottomRightCorner - Offset(0, cornerSize), paint);

    // Draw the text
    final textStyle = TextStyle(
      color: Colors.blue,
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    );

    final textPainter = TextPainter(
      text: TextSpan(
        text: 'Place your passport inside this box',
        style: textStyle,
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    final textX = (size.width - textPainter.width) / 2;
    final textY = rectTop + rectHeight + 10.0; // Adjust the vertical position of the text

    textPainter.paint(canvas, Offset(textX, textY));
  }

  @override
  bool shouldRepaint(PassportOverlayPainter oldDelegate) {
    return false;
  }
}
