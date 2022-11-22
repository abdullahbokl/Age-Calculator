import 'package:age_calc/models/global.dart';
import 'package:intl/intl.dart';
import 'build_header_widget.dart';
import 'package:flutter/material.dart';

class BuildColumn4TitleAndTextField extends StatefulWidget {
  String label;
  bool isAge;
  BuildColumn4TitleAndTextField(this.label, this.isAge);

  @override
  State<BuildColumn4TitleAndTextField> createState() =>
      _BuildColumn4TitleAndTextFieldState();
}

class _BuildColumn4TitleAndTextFieldState
    extends State<BuildColumn4TitleAndTextField> {
  DateTime selectedDate = DateTime.now();

  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildHeader(label: widget.label),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: _textController,
          showCursor: true,
          readOnly: true,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(Icons.calendar_month),
              onPressed: _onPressed,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ],
    );
  }


  _onPressed(){
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1940),
        lastDate: DateTime.now())
        .then((date) {
      if (date != null) {
        if (widget.isAge == true) {
          dateOfBirth = date;
        } else {
          nowDate = date;
        }
        setState(() {
          _textController.text =
              DateFormat("dd-MM-yyyy").format(date);
        });
      }
    });
  }

}
