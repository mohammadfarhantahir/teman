
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNumberInputRow extends StatefulWidget {
  @override
  _PhoneNumberInputRowState createState() => _PhoneNumberInputRowState();
}

class _PhoneNumberInputRowState extends State<PhoneNumberInputRow> {
  String _selectedCountryCode = '+1'; // Default country code
  TextEditingController _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DropdownButton<String>(
          value: _selectedCountryCode,
          onChanged: (String? newValue) {
            setState(() {
              _selectedCountryCode = newValue!;
            });
          },
          items: <String>['+1', '+91', '+61', '+86']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: _phoneNumberController,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              LengthLimitingTextInputFormatter(10),
            ],
            decoration: InputDecoration(
              labelText: 'Mobile Number',
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
        ),
      ],
    );
  }
}
