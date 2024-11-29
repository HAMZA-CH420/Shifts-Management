import 'package:flutter/material.dart';

class CustomBanner extends StatelessWidget {
  CustomBanner({super.key, required this.bannerTitle});
  final String bannerTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
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
