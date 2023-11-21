

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../bottom-nav-bar/screen/bottom-nav-bar.dart';
import '../../sign-up-screen/widget/pattern-divider/line-pattern-divider.dart';
import '../widget/accommodation-detail-popup/accommodation-detail-popup.dart';

class AccommodationScreen extends StatefulWidget{
  State<AccommodationScreen> createState()=> AccommodationScreenState();
}

class AccommodationScreenState extends State<AccommodationScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,

                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.white,
                ),
                child: Stack(
                  fit: StackFit.loose,
                  children: [
                    CachedNetworkImage(
                      imageUrl: "https://raptorassistant.com/teman/assets/dashbaord/dashboard-background.png",
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Container(), // Empty container to prevent layout issues
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //const SizedBox(height: 50,),


                            SizedBox( height: MediaQuery.of(context).size.height/3,),
                            Align(
                                alignment: Alignment.center,
                                child: Column(

                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(12),
                                      child: Text('ACCOMMODATION DETAILS',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'ShawBold',
                                          //   fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 50,),
                                    LinePatternDivider(),
                                    Container(
                                      padding: EdgeInsets.all(12),
                                      child: Text('Choose Method',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'ShawMedium',
                                          //   fontWeight: FontWeight.bold,
                                          fontSize: 28,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(12),

                                      width: 350,

                                      child: ElevatedButton(
                                          onPressed: () {
                                            // Perform the action when the button is pressed

                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.black, // Same as container color
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                          ),
                                          child: Row(
                                            // mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                  child:Icon(Icons.camera_alt)
                                              ),
                                              Expanded(
                                                child:Text('Capture Photo',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'ShawBold',
                                                    //   fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                              ),

                                            ],
                                          )
                                      ),
                                    ),


                                    Container(
                                      padding: EdgeInsets.all(12),
                                      width: 350,

                                      child: ElevatedButton(
                                          onPressed: () {
                                            // Perform the action when the button is pressed
                                            showDialog(
                                                context: context,
                                                builder: (context) =>Accommodationdetailpopup()
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.black, // Same as container color
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                          ),
                                          child: Row(
                                            // mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                  child:Icon(Icons.menu)
                                              ),
                                              Expanded(
                                                child:Text('Input Details Manually',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'ShawBold',
                                                    //   fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                              ),

                                            ],
                                          )
                                      ),
                                    ),
                                  ],
                                )
                            ),

                          ],
                        )
                    ),
                  ],
                ),
              )
          ),
            bottomNavigationBar: BottomNavbar(),
        )
    );
  }

}