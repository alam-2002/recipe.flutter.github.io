import 'package:flutter/material.dart';
import 'package:recipe_app/commons/text_widget.dart';

class GridViewCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  VoidCallback onTap;

  GridViewCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      // onTap: () {
      //   // Get.to(() => );
      // },
      child: Card(
        color: Colors.transparent,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Image.asset(imageUrl),
            Positioned(
              left: 30,
              bottom: 60,
              child: Label(
                label: name,
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
