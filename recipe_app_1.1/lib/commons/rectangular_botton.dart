import 'package:flutter/material.dart';
import 'package:recipe_app/theme/colors_class.dart';
import 'text_widget.dart';

class RectangularButton extends StatelessWidget {

  final String title;
  final VoidCallback? onPressed;
  const RectangularButton({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: ColorsClass.primaryOrange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
              )
          ),
          child: Label(
            label: title,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}