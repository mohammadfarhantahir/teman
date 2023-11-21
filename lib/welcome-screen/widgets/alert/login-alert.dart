

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../passport-camera/screen/passport-camera.dart';
import 'alert-button/gallery-button.dart';

class PassportAlert extends StatefulWidget{
  final List<CameraDescription> cameras;

  PassportAlert({required this.cameras});
  State<PassportAlert> createState()=> PassportAlertState();
}

class PassportAlertState extends State<PassportAlert>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Icon(Icons.cancel,
                size: 35,
              ),
            )
          )
        ],
      ),
      content: Container(
        height: 200,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ThreeDElevatedButton(
                text: 'Gallery',
                onPressed: () {

                },
              ),
            ),
            SizedBox(height: 50,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ThreeDElevatedButton(
                text: 'Camera',
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PassportCameraScreen(cameras: widget.cameras), // Pass cameras list
                    ),
                  );
                },
              ),
            )
          ],
        ),
      )
    );
  }

}