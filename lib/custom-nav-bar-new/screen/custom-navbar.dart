

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatefulWidget{
  State<CustomNavBar> createState()=> CustomNavBarState();
}

class CustomNavBarState  extends State<CustomNavBar>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage("https://raptorassistant.com/teman/assets/bottom-bar/Screenshot%202023-08-02%20at%206.14.26%20PM.png"),
              fit: BoxFit.cover,
          ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            offset: Offset(1, 5),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            Expanded(
                child:Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: "https://raptorassistant.com/teman/assets/bottom-bar/bottom-left/Info_alt%403x.png",
                      imageBuilder: (context, imageProvider) => Container(
                        height: 50,
                        width: 50,
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
                    Text('ASSISTANCE',
                      style: TextStyle(
                        fontFamily: 'ShawBold',
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),

                  ],
                ),
            ),
          Expanded(
            child:Stack(
              children: [
                Positioned(
                  bottom:20,
                    child: CachedNetworkImage(
                      imageUrl: "https://raptorassistant.com/teman/assets/bottom-bar/bottom-left/Info_alt%403x.png",
                      imageBuilder: (context, imageProvider) => Container(
                        height: 50,
                        width: 50,
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
                ),
                Text('Assistant',
                  style: TextStyle(
                    fontFamily: 'ShawBold',
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),

              ],
            ),
          ),
          Expanded(
            child:Column(
              children: [
                CachedNetworkImage(
                  imageUrl: "https://raptorassistant.com/teman/assets/bottom-bar/bottom-right/Screenshot%202023-08-02%20at%206.25.59%20PM.png",
                  imageBuilder: (context, imageProvider) => Container(
                    height: 50,
                    width: 50,
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
                Text('WALLET',
                  style: TextStyle(
                    fontFamily: 'ShawBold',
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),

              ],
            ),
          )
        ],
      ),
      
    );
  }

}