

import 'package:cached_network_image/cached_network_image.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../welcome-screen/widgets/alert/login-alert.dart';
import '../../welcome-screen/widgets/google-sign-in/google-sign-in-button.dart';
import '../../welcome-screen/widgets/textfield/comman-textfield-login.dart';

class LoginScreen extends StatefulWidget{
  final List<CameraDescription> cameras;

  LoginScreen({required this.cameras});
  State<LoginScreen> createState()=> LoginScreenState();
}

class LoginScreenState extends State<LoginScreen>{
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
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
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            Text('LOG IN',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 20,),
                            Text('AS EXISTING USER',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 20,),
                            ElevatedButton(
                              onPressed: () {
                                print('clicked');
                                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => DailyPairing()));
                                // Button action
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                                onPrimary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(12),
                                child: Text(
                                  'Create New Account',
                                  style: TextStyle(
                                    fontFamily: 'TemanOverload',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 29,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 20,),
                            Container(
                              width: 350,
                              child:  GoogleSignInButton(
                                text: 'Sign In With Google',
                                onPressed: (){
                                  print('Clicked');
                                },

                              ),
                            ),
                            SizedBox(height: 20,),
                            Text('OR',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'ShawMedium',
                                //   fontWeight: FontWeight.bold,
                                fontSize: 19,
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              padding: EdgeInsets.all(12),
                              child: MyTextField(
                                controller: _emailController,
                                suffixIcon: Icons.email,
                                hintText: 'Enter Email',


                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              padding: EdgeInsets.all(12),
                              child: MyTextField(
                                controller: _passwordController,
                                suffixIcon: Icons.password,
                                hintText: 'password',


                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(12),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text('Forget Password?',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'ShawMedium',
                                    //   fontWeight: FontWeight.bold,
                                    fontSize: 19,
                                  ),
                                ),
                              ),
                            ),
                         /*   Container(
                              padding: EdgeInsets.all(12),
                              child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Column(
                                    children: [
                                      Text('Scan Passport',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'ShawMedium',
                                          //   fontWeight: FontWeight.bold,
                                          fontSize: 19,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: (){
                                          print('scan passport clicked');
                                          showDialog(
                                            context: context,
                                            builder: (context) => PassportAlert(cameras: widget.cameras,)
                                          );
                                        },
                                        child: Icon(
                                          Icons.folder,
                                          size: 52,
                                        ),
                                      )

                                    ],
                                  )
                              ),
                            ),*/
                            SizedBox(height: 200,)
                          ],
                        ),
                      )


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
        )
      /* bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40)
            ),
            height: 100,
            padding: EdgeInsets.all(12),
            child: CustomNavBar(),
          ),*/
    );

  }

}