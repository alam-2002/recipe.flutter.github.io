import 'package:flutter/material.dart';
import 'package:get/get.dart';


class UserInputTextField extends StatelessWidget {

  String hintText;
  TextInputType keyboardType;
  TextEditingController? controller;

  UserInputTextField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 18, right: 18),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: TextFormField(
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