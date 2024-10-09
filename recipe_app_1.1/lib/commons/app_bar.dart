// import 'package:famani_parcel_delivery/theme/colors_class.dart';
import 'package:flutter/material.dart';
import 'text_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  AppBar appBar;
  String title;
  double? fontSize;

  CustomAppBar({
    required this.appBar,
    required this.title,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
          size: 25,
        ),
      ),
      centerTitle: true,
      title: Label(
        label: title,
        color: Colors.black,
        fontWeight: FontWeight.w900,
        fontSize: fontSize ?? 25,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
