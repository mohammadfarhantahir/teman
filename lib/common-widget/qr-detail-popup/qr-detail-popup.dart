

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../sign-up-screen/widget/alerts/sign-up-alerts/sign-up-alerts.dart';
import '../../sign-up-screen/widget/pattern-divider/line-pattern-divider.dart';

class Qrdetailpopup extends StatefulWidget{
  State<Qrdetailpopup> createState()=> QrdetailpopupState();
}

class QrdetailpopupState extends State<Qrdetailpopup>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            width: 100,
            child: ElevatedButton(
              onPressed: () {
                // Perform the action when the button is pressed
                Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (context) =>SignupAlert(showstatus: false,)
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xff77CDFF), // Same as container color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text('Details',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'ShawBold',
                  //   fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),

          InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(Icons.cancel,
            size: 32,

            ),
          )

        ],
      ),
      content: Container(
        padding: EdgeInsets.all(12),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color:  Color(0xff77CDFF), // Set the background color
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(Icons.qr_code_outlined),
                    )
                ),
                Expanded(
                    child: Text('QR Code Details',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'ShawBold',
                        //   fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Text('YOUR QR CODE',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'ShawMedium',
                //   fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20,),
            LinePatternDivider(),
            SizedBox(height: 20,),
            Text('Dear Visitor,please use this QR code at airport whilemaking  physically ENTRY. ',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'ShawRegular',
                //   fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black)
              ),
              child:CachedNetworkImage(
                imageUrl: "https://raptorassistant.com/teman/assets/signup/alert/qr.png",
                imageBuilder: (context, imageProvider) => Container(
                  height: 280,
                  width: 280,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.contain,
                      //  colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                    ),
                  ),
                ),
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            )
          ],
        ),
      ),
    );
  }

}