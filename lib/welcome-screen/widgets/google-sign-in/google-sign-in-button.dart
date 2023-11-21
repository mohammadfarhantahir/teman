import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GoogleSignInButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  GoogleSignInButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.white, // Change the color according to your UI
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Expanded(
             child: CachedNetworkImage(
               imageUrl: "https://raptorassistant.com/teman/assets/login/google-sign-in/Screenshot%202023-08-04%20at%206.06.25%20PM.png",
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
             )
         ),
          SizedBox(width: 10),
          Expanded(
              child: Text(text,
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'TemanOverload',
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              )
          ),
        ],
      ),
    );
  }
}
