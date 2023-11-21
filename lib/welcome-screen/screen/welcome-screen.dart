


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class WelcomeScreen extends StatefulWidget{
  State<WelcomeScreen> createState()=> TestState();
}

class TestState extends State<WelcomeScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
          body: CachedNetworkImage(
            imageUrl: "https://raptorassistant.com/teman/assets/welcome/Screenshot%202023-08-04%20at%205.48.36%20PM.png",
            imageBuilder: (context, imageProvider) => Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  //  colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                ),
              ),
              child: Stack(
                children: [

                  Center(
                    child: CachedNetworkImage(
                      imageUrl: "https://raptorassistant.com/teman/assets/welcome/Screenshot%202023-08-04%20at%205.33.09%20PM.png",
                      imageBuilder: (context, imageProvider) => Container(
                        height: 450,
                        width: 450,
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


                  ),

                  Align(
                    alignment: Alignment.bottomRight,
                    child:InkWell(
                      onTap: (){

                        print('clicked');
                        Navigator.pushNamed(context, '/LoginScreen'); // Navigate to the dashboard


                      },
                      child:  CachedNetworkImage(
                        imageUrl: "https://raptorassistant.com/teman/assets/welcome/body_right_bottom.png",
                        imageBuilder: (context, imageProvider) => Container(
                          height: 200,
                          width: 200,
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
                    ),


                  )
                ],
              ),
            ),
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          /* bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40)
            ),
            height: 100,
            padding: EdgeInsets.all(12),
            child: CustomNavBar(),
          ),*/
        )
    );
  }

}