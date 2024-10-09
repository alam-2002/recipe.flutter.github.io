import 'package:flutter/material.dart';


class UserInputTextField extends StatelessWidget {

  String? hintText;
  TextInputType? keyboardType;
  TextEditingController? controller;
  String? initialValue;
  bool readOnly;

  UserInputTextField({
    super.key,
    this.hintText,
    this.keyboardType,
    this.controller,
    this.initialValue,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0, right: 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: TextFormField(
          readOnly: readOnly ?? false,
          initialValue: initialValue,
          controller: controller,
          keyboardType: keyboardType,
          style: TextStyle(
            color: Colors.black,
          ),
          cursorColor: Colors.grey,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2.0),
              borderRadius: BorderRadius.circular(5),
            ),
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}