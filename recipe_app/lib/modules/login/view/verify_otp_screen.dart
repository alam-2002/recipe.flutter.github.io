import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:recipe_app/commons/app_bar.dart';
import 'package:recipe_app/commons/text_widget.dart';
import 'package:recipe_app/modules/home/1.home_screen/view/home_screen.dart';
import 'package:recipe_app/theme/colors_class.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBar: AppBar(), title: 'Verify OTP'),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              SizedBox(height: 50),
              Center(
                child: Label(
                  label: 'We have sent a verification code to',
                ),
              ),
              Label(
                label: '+91 745656565656',
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 100),
              OTPTextField(
                length: 4,
                width: Get.width,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 50,
                fieldStyle: FieldStyle.box,
                isDense: true,
                otpFieldStyle: OtpFieldStyle(
                  enabledBorderColor: ColorsClass.basicBlack,
                  focusBorderColor: ColorsClass.primaryOrange,
                  disabledBorderColor: ColorsClass.basicBlack,
                ),
                style: const TextStyle(
                    fontSize: 20, color: ColorsClass.basicBlack),
                onChanged: (code) {
                  // otp = code;
                  // OTPController.instance.verifyOTP(otp);
                  // print("onChanged:  $code");
                },
                onCompleted: (code) {
                  // otp = code;
                  // OTPController.instance.verifyOTP(otp);
                  // print("onComplete:  $code");
                },
              ),
              SizedBox(height: 50),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Label(
                    label: 'Resend text in 20 sec',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => HomeScreen());
              },
              style: ButtonStyle(
                minimumSize: WidgetStateProperty.all<Size>(
                  Size(Get.width, 50),
                ),
                backgroundColor:
                    WidgetStateProperty.all<Color>(Color(0xFFFF6600)),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                ),
              ),
              child: Text(
                'Verify OTP',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
