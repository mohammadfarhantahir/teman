

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../repository/login/login-api.dart';

class LoginScreenNew extends StatefulWidget{
  State<LoginScreenNew> createState()=> LoginScreenNewState();
}

class LoginScreenNewState  extends State<LoginScreenNew>{

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;


  // Login

  void _performLogin() async {
    final apiHelper = ApiHelper('https://raptorassistant.com:8787');
    try {
      final response = await apiHelper.login(
        _usernameController.text,
        _passwordController.text,
      );

      // Handle the response data
      if (response['success']) {
        // Successful login
        print('Login successful');
        print('User details: ${response['user']}');
      } else {
        // Handle login failure
        print('Login failed: ${response['message']}');
      }
    } catch (e) {
      // Handle network or other errors
      print('Error: $e');
    }
  }
  // end of login


  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Color(0xff1F2E3C),
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      SizedBox(height: 100,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Sign in to your',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'ShawBold',
                            //   fontWeight: FontWeight.bold,
                            fontSize: 32,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Account',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'ShawBold',
                            //   fontWeight: FontWeight.bold,
                            fontSize: 32,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Sign in to your Account',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'ShawRegular',
                            //   fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      )


                    ],

                  ),
                ),
                Container(
                    height: MediaQuery.of(context).size.height,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          TextFormField(
                              controller: _usernameController,
                            style: TextStyle(color: Colors.grey), // Text color
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(color: Colors.grey), // Label text color
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              // fillColor: Colors.white.withOpacity(0.1), // Field background color
                              filled: true,
                            ),
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: !_isPasswordVisible,
                            style: TextStyle(color: Colors.grey), // Text color
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Colors.grey), // Label text color
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              filled: true,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                                child: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text('Forgot Password?',
                              style: TextStyle(
                                color: Color(0xffC0E863),
                                fontFamily: 'ShawBold',
                                //   fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(height: 40,),
                          Container(
                            height: 50,
                            width: 350,
                            child: ElevatedButton(
                              onPressed: _performLogin,
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffC0E863), // Same as container color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text('Login',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'ShawBold',
                                  //   fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),

                          Row(
                            children: [
                              Expanded(
                                child:Divider(
                                  thickness: 1,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 20,),

                              Expanded(
                                child:Text('Or Login with',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'ShawRegular',
                                    //   fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                child:Divider(
                                  thickness: 1,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 40,),
                          Container(
                            height: 50,
                            width: 350,
                            child: ElevatedButton(
                              onPressed: () {
                                // Perform the action when the button is pressed
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffC0E863), // Same as container color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CachedNetworkImage(
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
                                  ),
                                  SizedBox(width: 10),
                                  Text('Sign in with google',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'ShawRegular',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 40,),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  flex:7,
                                    child: Text('Don\'t have an account?',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'ShawRegular',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19,
                                      ),
                                      textAlign: TextAlign.right,
                                    )
                                ),

                                Expanded(
                                    flex:3,
                                    child: InkWell(
                                      onTap: (){
                                        Navigator.pushNamed(context, '/SignupScreen'); // Navigate to the dashboard

                                      },
                                      child: Text('Register',
                                        style: TextStyle(
                                          color: Color(0xffC0E863),
                                          fontFamily: 'ShawRegular',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 19,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    )
                                ),
                              ],
                            ),
                          )

                        ],
                      ),
                    )
                )
              ],
            ),
          )
        )
    );
  }

}