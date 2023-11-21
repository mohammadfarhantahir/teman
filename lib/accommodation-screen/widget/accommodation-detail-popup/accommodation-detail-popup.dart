



import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../sign-up-screen/widget/pattern-divider/line-pattern-divider.dart';

class Accommodationdetailpopup extends StatefulWidget{
  State<Accommodationdetailpopup> createState()=> AccommodationdetailpopupState();
}

class AccommodationdetailpopupState extends State<Accommodationdetailpopup>{
  DateTime? _selectedFromDate;
  DateTime? _selectedToDate;

  void _showDatePicker(String buttonType) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        if (buttonType == 'From') {
          _selectedFromDate = pickedDate;
        } else if (buttonType == 'To') {
          _selectedToDate = pickedDate;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [


          InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(Icons.cancel,
              size: 32,

            ),
          )

        ],
      ),
      content: Container(
        padding: EdgeInsets.all(12),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color:  Color(0xff77CDFF), // Set the background color
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(Icons.hotel),
                      )
                  ),
                  Expanded(
                    child: Text('Please fill the Details Manually',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'ShawBold',
                        //   fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Text('ACCOMMODATION DETAILS',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'ShawMedium',
                  //   fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20,),
              LinePatternDivider(),
              SizedBox(height: 20,),
              TextFormField(
                //  controller: _textEditingController,
                style: TextStyle(color: Colors.black), // Text color
                decoration: InputDecoration(
                  labelText: 'Name of friend or AIRBNB',
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
              SizedBox(height: 20,),
              LinePatternDivider(),
              SizedBox(height: 20,),
              TextFormField(
                maxLines: 5,
                //  controller: _textEditingController,
                style: TextStyle(color: Colors.black), // Text color
                decoration: InputDecoration(
                  labelText: 'Address of friend or AIRBNB',
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
              SizedBox(height: 20,),
              LinePatternDivider(),
              SizedBox(height: 20,),
              Text('Duration',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'ShawBold',
                  //   fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20,),
              LinePatternDivider(),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child:   _buildDateButton('From', _selectedFromDate),
                  ),
                  Expanded(
                    child:   _buildDateButton('To', _selectedToDate),

                  )
                ],
              ),
              SizedBox(height: 20,),
              LinePatternDivider(),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(12),


                child: ElevatedButton(
                    onPressed: () {
                      // Perform the action when the button is pressed
                      Navigator.of(context).pop();

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
                            child:Icon(Icons.save)
                        ),
                        Expanded(
                          child:Text('Save information',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'ShawBold',
                              //   fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),

                      ],
                    )
                ),
              ),
            ],
          ),
        )
      ),
    );
  }

  Widget _buildDateButton(String buttonType, DateTime? selectedDate) {
    return Column(
      children: [
        TextButton(
          onPressed: () => _showDatePicker(buttonType),
          child: Text(
            selectedDate == null
                ? 'Select $buttonType Date'
                : '$buttonType Date: ${selectedDate.toLocal()}'.split(' ')[0],
            style: TextStyle(fontSize: 18),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

