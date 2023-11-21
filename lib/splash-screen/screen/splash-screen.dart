

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../sign-up-screen/widget/pattern-divider/line-pattern-divider.dart';

class SplashScreen extends StatefulWidget{
  State<SplashScreen> createState()=> SplashScreenState();
}
class SplashScreenState extends State<SplashScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child:Scaffold(
          body: SingleChildScrollView(
            child: Column(

              children: [
                SizedBox(height: 220,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 20,),
                    Expanded(
                        child: Text('Good Evening 👋' ,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'ShawBold',
                            //   fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        )
                    ),
                    Expanded(
                        child: Text('Mohd Rais Siddiqui',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'ShawRegular',
                            //   fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        )
                    ),

                    SizedBox(width: 20,),

                  ],
                ),

                SizedBox(height: 20,),

                CachedNetworkImage(
                  imageUrl: "https://raptorassistant.com/teman/assets/introductionscreen/itnro3.png",
                  imageBuilder: (context, imageProvider) => Container(
                    height: 350,
                    width: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.contain,
                        //  colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                      ),
                    ),
                  ),
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                LinePatternDivider(),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(width: 20,),
                    Container(
                      height: 50,
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          // Perform the action when the button is pressed
                          Navigator.of(context).pop();
                          Navigator.pushNamed(context, '/LoginScreen'); // Navigate to the dashboard

                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffC0E863), // Same as container color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text('Skip',
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

                    SizedBox(width: 20,),
                  ],
                ),
                SizedBox(height: 20,),
                LinePatternDivider(),
              ],
            ),
          ),
        )
    );
  }

}