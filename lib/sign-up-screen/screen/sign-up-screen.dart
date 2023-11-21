


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/alerts/sign-up-alerts/sign-up-alerts.dart';
import '../widget/date-input-widget.dart';
import '../widget/phone-number-widget.dart';

class SignupScreen extends StatefulWidget{
  final String full_name;
  final String email;

  SignupScreen({
    required this.full_name,
    required this.email
  });
  State<SignupScreen> createState()=> SignupScreenState();
}

class SignupScreenState extends State<SignupScreen>{
  String? _selectedGender;
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmpasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isconfirmPasswordVisible = false;
  String selectedGender = '';
  bool _yesChecked = false;
  bool _noChecked = false;
  @override
  void dispose() {
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    // Use the full_name parameter from the widget or arguments
    final String full_name = args?['full_name'] ?? widget.full_name;
    final String email_ = args?['email'] ?? widget.email;
    // TODO: implement build
    return SafeArea(
        child:Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Color(0xff1F2E3C),
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      SizedBox(height: 100,),
                      Row(
                        children: [
                          Expanded(
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Register',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'ShawBold',
                                        //   fontWeight: FontWeight.bold,
                                        fontSize: 32,
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 10,),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Create your account',
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
                              )
                          ),
                          Expanded(
                              child:Align(
                                alignment: Alignment.bottomRight,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Action to perform when the button is pressed
                                    print('Button pressed!');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white, // Background color of the button
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.document_scanner,
                                      color: Colors.black,
                                      ), // Icon
                                      SizedBox(width: 8.0), // Add some space between the icon and text
                                      Text(
                                        'Sacn Passport',
                                          style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'ShawRegular',
                                          //   fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                      ),
                                  textAlign: TextAlign.left,
                                      ), // Text
                                    ],
                                  ),
                                )
                              )
                          )
                        ],
                      )



                    ],

                  ),
                ),
                Container(
                   // height: MediaQuery.of(context).size.height,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          TextFormField(
                            //  controller: _textEditingController,
                            style: TextStyle(color: Colors.grey), // Text color
                            decoration: InputDecoration(
                              labelText: full_name,
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
                            //  controller: _textEditingController,
                            style: TextStyle(color: Colors.grey), // Text color
                            decoration: InputDecoration(
                              labelText: email_,
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
                          TextFormField(
                            controller: _confirmpasswordController,
                            obscureText: !_isconfirmPasswordVisible,
                            style: TextStyle(color: Colors.grey), // Text color
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
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
                                    _isconfirmPasswordVisible = !_isconfirmPasswordVisible;
                                  });
                                },
                                child: Icon(
                                  _isconfirmPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),


                          SizedBox(height: 20,),
                          TextFormField(
                            //  controller: _textEditingController,
                            style: TextStyle(color: Colors.grey), // Text color
                            decoration: InputDecoration(
                              labelText: 'Nationality',
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
                         /* Row(
                            children: [
                              Expanded(
                                  child:
                              ),
                              SizedBox(width: 20,),
                             *//* Expanded(
                                child:  TextFormField(
                                  //  controller: _textEditingController,
                                  style: TextStyle(color: Colors.grey), // Text color
                                  decoration: InputDecoration(
                                    labelText: 'Place of birth',
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
                              ),*//*
                            ],
                          ),*/
                          SizedBox(height: 20,),
                          Column(
                            children: [
                             Align(
                               alignment: Alignment.centerLeft,
                               child:  Text('Select your gender',
                                 style: TextStyle(
                                   color: Colors.black,
                                   fontFamily: 'ShawBold',
                                   //   fontWeight: FontWeight.bold,
                                   fontSize: 18,
                                 ),
                                 textAlign: TextAlign.left,
                               ),
                             ),
                              Container(
                                width: 350,
                                child: DropdownButton<String>(
                                  hint: Text('Select gender'), // Initial hint text
                                  value: _selectedGender,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _selectedGender = newValue!;
                                    });
                                  },
                                  items: <String>['Male', 'Female', 'Non-binary'].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),

                            ],
                          ),
                          SizedBox(height: 20,),
                          Container(
                            padding: EdgeInsets.all(5),
                            child:  DateInputWidget(),
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            //  controller: _textEditingController,
                            style: TextStyle(color: Colors.grey), // Text color
                            decoration: InputDecoration(
                              labelText: 'Passport Number',
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
                          SizedBox(
                            height: 20,
                          ),
                          PhoneNumberInputRow(),
                          SizedBox(height: 20,),
                          Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(12)
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 10,),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text('Are you working in Sabah?',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'ShawBold',
                                        //   fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child:Checkbox(
                                            value: _yesChecked,
                                            activeColor: Colors.white,
                                            onChanged: (value) {
                                              setState(() {
                                                _yesChecked = value!;
                                                if (_yesChecked) {
                                                  _noChecked = false;
                                                }
                                              });
                                            },
                                          )
                                      ),
                                      Expanded(
                                          child:Text('Yes')
                                      ),
                                      SizedBox(width: 20),
                                      Expanded(
                                          child: Checkbox(
                                            value: _noChecked,

                                            activeColor: Colors.white,
                                            onChanged: (value) {
                                              setState(() {
                                                _noChecked = value!;
                                                if (_noChecked) {
                                                  _yesChecked = false;
                                                }
                                              });
                                            },
                                          )
                                      ),
                                      Expanded(
                                          child: Text('No')
                                      ),
                                    ],
                                  ),
                                ],
                              )
                          ),
                          SizedBox(height: 20,),
                          Container(
                            height: 50,
                            width: 350,
                            child: ElevatedButton(
                              onPressed: () {
                                // Perform the action when the button is pressed
                                showDialog(
                                    context: context,
                                    builder: (context) =>SignupAlert(showstatus: true,)
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffC0E863), // Same as container color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text('Register',
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

                          SizedBox(height: 20,),

                        ],
                      ),
                    )
                )
              ],
            ),
          ),
        )
    );
  }

}