import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/commons/app_bar.dart';
import 'package:recipe_app/commons/text_widget.dart';
import 'package:recipe_app/modules/login/view/verify_otp_screen.dart';
import 'package:recipe_app/theme/colors_class.dart';


class PhoneLoginScreen extends StatelessWidget {
  const PhoneLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        title: 'LOGIN',
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Label(
                label: 'Let’s Start With Your',
                fontSize: 22,
              ),
              Label(
                label: 'Phone/Email',
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 20),
              _countrySelector(),
              SizedBox(height: 300),
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
                Get.to(() => VerifyOtpScreen());
              },
              style: ButtonStyle(
                minimumSize: WidgetStateProperty.all<Size>(
                  Size(Get.width, 50),
                ),
                backgroundColor: WidgetStateProperty.all<Color>(Color(0xFFFF6600)),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                ),
              ),
              child: Text(
                'Get OTP',
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

  Widget _countrySelector() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(left: 0, right: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, right: 0),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: ColorsClass.basicBlack,
                ),
                borderRadius: BorderRadius.circular(5)),
            child: CountryListPick(
              appBar: AppBar(
                iconTheme: IconThemeData(
                  color: ColorsClass.basicWhite,
                ),
                centerTitle: true,
                backgroundColor: ColorsClass.primaryOrange,
                title: Label(
                  label: 'Choose Your Contry',
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                  color: ColorsClass.basicWhite,
                ),
              ),
              theme: CountryTheme(
                alphabetSelectedBackgroundColor: ColorsClass.primaryOrange,
                isShowFlag: true,
                isShowTitle: false,
                isShowCode: false,
                isDownIcon: true,
                showEnglishName: true,
              ),
              initialSelection: 'US',
              onChanged: (CountryCode? code) {
              },
              useUiOverlay: true,
              useSafeArea: false,
            ),
          ),
          Expanded(child: _userPhoneInput())
        ],
      ),
    );
  }

  Widget _userPhoneInput() {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          border: Border.all(color: ColorsClass.basicBlack),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: TextFormField(
            // controller: signupController.phoneNumber,
            keyboardType: TextInputType.number,
            style: TextStyle(
              fontSize: 15,
              color: ColorsClass.basicBlack,
            ),
            cursorColor: ColorsClass.basicBlack,
            decoration: const InputDecoration(
              enabledBorder: InputBorder.none,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: 'Enter Your Phone Number',
            ),
          ),
        ),
      ),
    );
  }
}
