
import 'package:flutter/material.dart';
class DateInputWidget extends StatefulWidget {
  @override
  _DateInputWidgetState createState() => _DateInputWidgetState();
}

class _DateInputWidgetState extends State<DateInputWidget> {
  TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'Date of Birth in [DD/MM/YYYY] format',
          border: OutlineInputBorder(),
        ),
        onChanged: (text) {
          if (text.length == 2 || text.length == 5) {
            _controller.text = '$text/';
            _controller.selection = TextSelection.fromPosition(
              TextPosition(offset: _controller.text.length),
            );
          } else if (text.length > 10) {
            _controller.text = text.substring(0, 10);
            _controller.selection = TextSelection.fromPosition(
              TextPosition(offset: _controller.text.length),
            );
          }
        },
      ),
    );
  }
}
