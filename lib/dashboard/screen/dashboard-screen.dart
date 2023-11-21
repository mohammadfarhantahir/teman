


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../bottom-nav-bar/screen/bottom-nav-bar.dart';
import '../../common-widget/qr-detail-popup/qr-detail-popup.dart';
import '../widget/image-slider/image-slider-dashboard.dart';

class DashboardScreen extends StatefulWidget{
  State<DashboardScreen> createState()=> DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen>{

  PageController _pageController = PageController(initialPage: 0);
  List<String> _imageUrls = [
    'https://media.istockphoto.com/id/483422161/photo/scenic-view-of-tropical-islands-bohey-dulang-semporna-sabah.jpg?s=612x612&w=0&k=20&c=YiYcJREg4sv-nZexr5BEaQDc_GhhAsbzSNNxIWTTP7c=',
    'https://d2rdhxfof4qmbb.cloudfront.net/wp-content/uploads/20180221132939/iStock-510684350-1.jpg',
    'https://media.istockphoto.com/id/1360701608/photo/aerial-view-of-the-selakan-island-semporna-sabah-malaysia.jpg?s=612x612&w=0&k=20&c=YiwZUkVed6jRN-70IqMOeTvQYtrDB09NfkM9sIsyMzw=',
  ];
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(

          backgroundColor: Colors.white,
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
                        CachedNetworkImage(
                          imageUrl: "https://raptorassistant.com/teman/assets/signup/alert/guid.png",
                          imageBuilder: (context, imageProvider) => Container(
                            height: 180,
                            width: 180,
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
                        SizedBox(height: 20,),
                        Text('John Doe',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'ShawBold',
                            //   fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text('@Johndoe',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'ShawRegular',
                            //   fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text('View QR',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'ShawBold',
                            //   fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: 20,),
                        CachedNetworkImage(
                          imageUrl: "https://raptorassistant.com/teman/assets/dashbaord/qrdas.png",
                          imageBuilder: (context, imageProvider) => Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.contain,
                                //  colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                              ),
                            ),
                            child: InkWell(
                              onTap: (){
                                print('qr clicked');
                                showDialog(
                                    context: context,
                                    builder: (context) =>Qrdetailpopup()
                                );
                              },
                            ),
                          ),
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) => Icon(Icons.error),

                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(height: 20,),
                            Expanded(
                                child: Column(
                                  children: [
                                    Text('Last Trip',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'ShawBold',
                                        //   fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text('02/02/2023',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'ShawRegular',
                                        //   fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                )
                            ),
                            SizedBox(width: 20,),
                            Expanded(
                                child: Column(
                                  children: [
                                    Text('Last Trip From',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'ShawBold',
                                        //   fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text('India',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'ShawRegular',
                                        //   fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                )
                            ),
                            SizedBox(width: 20,),
                            Expanded(
                                child:Column(
                                  children: [
                                    Text('Status',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'ShawBold',
                                        //   fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text('Clear',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'ShawRegular',
                                        //   fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                )
                            ),
                            SizedBox(width: 20,),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(12),
                                  child: Text('Place Of Interest',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'ShawBold',
                                      //   fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                )
                            ),
                            Expanded(
                                child:Container(
                                  padding: EdgeInsets.all(12),
                                  width: MediaQuery.of(context).size.width/2,

                                  child: ElevatedButton(
                                      onPressed: () {
                                        // Perform the action when the button is pressed
                                        Navigator.pushNamed(context, '/AccommodationScreen'); // Navigate to the dashboard

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
                                            child:Text('Start New Trip',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'ShawBold',
                                                //   fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          Expanded(
                                              child:Icon(Icons.refresh)
                                          )
                                        ],
                                      )
                                  ),
                                ),
                            )
                          ],
                        ),

                        Container(
                          height: 200,
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: _imageUrls.length,
                            itemBuilder: (context, index) {
                              return CardWidget(imageUrl: _imageUrls[index]);
                            },
                          ),
                        )
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