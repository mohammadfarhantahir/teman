
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../pattern-divider/line-pattern-divider.dart';

class SignupAlert extends StatefulWidget{
  final bool showstatus;
  SignupAlert({required this.showstatus});
  State<SignupAlert> createState()=> SignupAlertState();
}

class SignupAlertState extends State<SignupAlert>{
  bool _yesChecked = false;
  bool _isedited = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
        backgroundColor: Color(0xff77CDFF), // Set the background color
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Expanded(
            flex: 9,
              child: widget.showstatus?Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child:Text('Want to edit ?',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'ShawRegular',
                            //   fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        )
                    ),
                    Expanded(
                        child:InkWell(
                            onTap: (){
                              setState(() {

                                _isedited = false;
                                print('value of editing is ==>'+_isedited.toString());
                                if(_isedited==true){
                                  Navigator.of(context).pop();
                                }
                                else{

                                }

                              });

                            },
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white38,
                              ),
                              child: _isedited?Icon(
                                Icons.edit,
                                size: 32,
                              ):InkWell(
                                onTap: (){
                                  setState(() {

                                    _isedited = true;
                                  });
                                },
                                child: const Icon(Icons.save,
                                  size: 32,
                                ),

                              ),
                            )
                        )
                    )
                  ],
                ),
              ):SizedBox()
          ),

         Expanded(
           flex: 1,
             child: InkWell(
               onTap: (){
                 Navigator.of(context).pop();
               },
               child: Icon(
                 Icons.cancel,
                 size: 32,
               ),
             ),
         )
        ],
      ),
      content: Container(
     //   color: Color(0xff77CDFF),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              LinePatternDivider(),
              CachedNetworkImage(
                imageUrl: "https://raptorassistant.com/teman/assets/signup/alert/sabah.png",
                imageBuilder: (context, imageProvider) => Container(
                  height: 150,
                  width: 150,
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
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child:  Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)
                        ),
                        child:CachedNetworkImage(
                          imageUrl: "https://raptorassistant.com/teman/assets/signup/alert/qr.png",
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
                          ),
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      )
                  ),
                  Expanded(
                    child:   CachedNetworkImage(
                      imageUrl: "https://raptorassistant.com/teman/assets/signup/alert/guid.png",
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
                      ),
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),

                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black)
                  ),
                  child: Text('DOB- 10-02-1992',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'ShawRegular',
                      //   fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              _isedited?Row(
                children: [

                  Expanded(
                      child: Column(
                        children: [
                          Text('Name - ',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'ShawBold',
                              //   fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text('Passport No - ',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'ShawBold',
                              //   fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text('Nationality - ',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'ShawBold',
                              //   fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text('Place of issue - ',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'ShawBold',
                              //   fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text('Date of issue - ',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'ShawBold',
                              //   fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text('Expiry date - ',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'ShawBold',
                              //   fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 20,),


                        ],
                      )
                  ),

                  Expanded(
                      child: Column(
                        children: [
                         Text('Mohd Rais',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'ShawRegular',
                              //   fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text('1417090',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'ShawRegular',
                              //   fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text('Indian',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'ShawRegular',
                              //   fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text('Lucknow',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'ShawRegular',
                              //   fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text('16-10-2020',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'ShawRegular',
                              //   fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text('16-10-2023',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'ShawRegular',
                              //   fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 20,),

                        ],
                      )
                  )

                ],
              ):Column(
                children: [
                  TextFormField(
                    //  controller: _textEditingController,
                    style: TextStyle(color: Colors.black), // Text color
                    decoration: InputDecoration(
                      labelText: 'Enter Name',
                      labelStyle: TextStyle(color: Colors.black), // Label text color
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
                  SizedBox(height: 10,),
                  LinePatternDivider(),
                  SizedBox(height: 10,),
                  TextFormField(
                    //  controller: _textEditingController,
                    style: TextStyle(color: Colors.black), // Text color
                    decoration: InputDecoration(
                      labelText: 'Enter Passport',
                      labelStyle: TextStyle(color: Colors.black), // Label text color
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
                  SizedBox(height: 10,),
                  LinePatternDivider(),
                  SizedBox(height: 10,),
                  TextFormField(
                    //  controller: _textEditingController,
                    style: TextStyle(color: Colors.black), // Text color
                    decoration: InputDecoration(
                      labelText: 'Enter Nationality',
                      labelStyle: TextStyle(color: Colors.black), // Label text color
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
                  SizedBox(height: 10,),
                  LinePatternDivider(),
                  SizedBox(height: 10,),
                  TextFormField(
                    //  controller: _textEditingController,
                    style: TextStyle(color: Colors.black), // Text color
                    decoration: InputDecoration(
                      labelText: 'Enter Place of issue',
                      labelStyle: TextStyle(color: Colors.black), // Label text color
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
                  SizedBox(height: 10,),

                  LinePatternDivider(),
                  SizedBox(height: 10,),
                  TextFormField(
                    //  controller: _textEditingController,
                    style: TextStyle(color: Colors.black), // Text color
                    decoration: InputDecoration(
                      labelText: 'Date of issue',
                      labelStyle: TextStyle(color: Colors.black), // Label text color
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
                  SizedBox(height: 10,),
                  LinePatternDivider(),
                  SizedBox(height: 10,),
                  TextFormField(
                    //  controller: _textEditingController,
                    style: TextStyle(color: Colors.black), // Text color
                    decoration: InputDecoration(
                      labelText: 'Enter Expiry Date',
                      labelStyle: TextStyle(color: Colors.black), // Label text color
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




                ],
              ),
              SizedBox(height: 20,),
              LinePatternDivider(),
              widget.showstatus?SizedBox():Row(
                children: [
                  Expanded(
                      child:Column(
                        children: [
                          Text('Reason for coming: ',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'ShawBold',
                              //   fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10,),
                          Text('Business purpose and visit to friend Mr. Yeoh EmLing ',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'ShawMedium',
                              //   fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                  ),
                  Expanded(
                    child:CachedNetworkImage(
                      imageUrl: "https://raptorassistant.com/teman/assets/signup/alert/qc-checked.png",
                      imageBuilder: (context, imageProvider) => Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.contain,
                              //  colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text('Verified by Sabah Airport',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'ShawBold',
                                //   fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                      ),
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  )
                ],
              ),
              LinePatternDivider(),
              widget.showstatus?Container(
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                        child:Text('I hearby declare that the information provide in this application is correct. ',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'ShawRegular',
                            //   fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.left,
                        )
                    ),
                    Text('I Agree',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'ShawBold',
                        //   fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Checkbox(
                      value: _yesChecked,
                      activeColor: Colors.white,
                      onChanged: (value) {
                        setState(() {
                          _yesChecked = value!;
                          if (_yesChecked) {
                            print('can do anything');
                          }
                        });
                      },
                    ),
                  ],
                ),
              ):SizedBox(),
              LinePatternDivider(),
              SizedBox(height: 20,),
              widget.showstatus?Container(
                height: 50,
                width: 350,
                child: ElevatedButton(
                  onPressed: () {
                    // Perform the action when the button is pressed
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, '/DashboardScreen'); // Navigate to the dashboard

                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffC0E863), // Same as container color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('Continue',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'ShawBold',
                      //   fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ):SizedBox(),
            ],
          ),
        )
      )
    );
  }

}