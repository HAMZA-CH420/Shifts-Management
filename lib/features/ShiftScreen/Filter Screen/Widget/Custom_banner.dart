import 'package:flutter/material.dart';

class CustomFilterBanner extends StatelessWidget {
  CustomFilterBanner({super.key, required this.bannerTitle});
  final String bannerTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            bannerTitle,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
