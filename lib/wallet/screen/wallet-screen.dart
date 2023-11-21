


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../bottom-nav-bar/screen/bottom-nav-bar.dart';

class WalletScreen extends StatefulWidget{
  State<WalletScreen> createState()=> WalletScreenState();
}

class WalletScreenState extends State<WalletScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child:Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            // automaticallyImplyLeading: false,
            iconTheme: IconThemeData(color: Colors.black), // Set the leading icon color

          ),
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text('Wallet',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'ShawBold',
                            //   fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text('Active',
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'ShawRegular',
                            //   fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),


                  ],
                ),
              ),
              Center(
                  child: Container(
                    height: 200,
                    child: CachedNetworkImage(
                      imageUrl: "https://raptorassistant.com/teman/assets/wallet/wallet-widget/wallet-widget.png",
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.contain,
                            //  colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                          ),
                        ),
                        child: Row(
                          children: [
                           Expanded(
                               child:  Align(
                                 alignment: Alignment.bottomLeft,
                                 child: Container(
                                   padding: EdgeInsets.all(30),
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       Text('Balance',
                                         style: TextStyle(
                                           color: Colors.white,
                                           fontFamily: 'ShawMedium',
                                           //   fontWeight: FontWeight.bold,
                                         //  fontSize: 20,
                                         ),
                                       ),
                                       SizedBox(height: 10,),
                                       Text('RM 20,000',
                                         style: TextStyle(
                                           color: Colors.white,
                                           fontFamily: 'ShawBold',
                                           //   fontWeight: FontWeight.bold,
                                           //fontSize: 15,
                                         ),
                                       ),

                                     ],
                                   ),
                                 )
                               )
                           ),
                            Expanded(
                                child:Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      padding: EdgeInsets.all(30),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('Card',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'ShawMedium',
                                              //   fontWeight: FontWeight.bold,
                                            //  fontSize: 20,
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Text('HongLeong Islamic Bank',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'ShawBold',
                                              //   fontWeight: FontWeight.bold,
                                             // fontSize: 15,
                                            ),
                                          ),

                                        ],
                                      ),
                                    )
                                )
                            )


                          ],
                        ),


                      ),
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  )


              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 10,),
                 Expanded(
                     child:  Container(
                       padding: EdgeInsets.all(08),
                       decoration: BoxDecoration(
                         color: Colors.blueAccent.shade100,
                         borderRadius: BorderRadius.circular(12),
                       ),
                       child: Column(
                         children: [
                           Icon(Icons.transfer_within_a_station),
                           Text('Transfer',
                             style: TextStyle(
                               color: Colors.black,
                               fontFamily: 'ShawBold',
                               //   fontWeight: FontWeight.bold,
                               fontSize: 15,
                             ),
                           ),
                         ],
                       ),
                     )
                 ),
                  SizedBox(width: 10,),
                  Expanded(
                      child:Container(
                        padding: EdgeInsets.all(08),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.currency_bitcoin),
                            Text('Transfer',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'ShawBold',
                                //   fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      )
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                      child: Container(
                        padding: EdgeInsets.all(08),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.payment_outlined),
                            Text('Payout',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'ShawBold',
                                //   fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      )
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                      child:Container(
                        padding: EdgeInsets.all(08),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.discount),
                            Text('Top up',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'ShawBold',
                                //   fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      )
                  ),
                  SizedBox(width: 10,),
                ],
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text('Last Transaction',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'ShawBold',
                        //   fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),

                    Text('View all',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'ShawBold',
                        //   fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                )
              ),
            ],
          ),
          bottomNavigationBar: BottomNavbar(),
        )
    );
  }

}